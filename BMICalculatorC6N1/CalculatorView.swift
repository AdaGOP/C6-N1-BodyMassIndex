//
//  CalculatorView.swift
//  BMICalculatorC6N1
//
//  Created by Handy Handy on 09/03/23.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var weightSlider: Double
    @Binding var heightSlider: Double
    @Binding var savedHistories: [BmiData]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Weight (kg)")
                        .font(.body)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(weightSlider, specifier: "%.0f")")
                        .font(.title)
                        .bold()
                        .padding(.top, 4)
                }
                Slider(
                    value: $weightSlider,
                    in: 35...150
                )
                Divider()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Height (cm)")
                        .font(.body)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(heightSlider, specifier: "%.0f")")
                        .font(.title)
                        .bold()
                        .padding(.top, 4)
                }
                Slider(
                    value: $heightSlider,
                    in: 130...200
                )
                Divider()
            }
            .padding(.top, 16)
            HStack {
                Text("Your Body Mass Index")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(calculateBMI(), specifier: "%.2f")")
                        .font(.largeTitle)
                        .bold()
                    Text("\(bmiScale())")
                        .font(.body)
                        .foregroundColor(bmiScaleColor())
                }
            }
            .padding(.top, 16)
            Button {
                let newBmiData = BmiData(savedDate: Date(), result: calculateBMI())
                savedHistories.insert(newBmiData, at: 0)
            } label: {
                Text("Save to history")
                    .frame(maxWidth: .infinity, maxHeight: 32)
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 16)
            Spacer()
        }
        .padding()
    }
    
    func calculateBMI() -> Double {
        return weightSlider * 10_000 / (heightSlider * heightSlider)
    }
    
    func bmiScale() -> String {
        switch calculateBMI() {
        case 0..<18.5:
            return "Underweight"
        case 18.6..<24.9:
            return "Normal"
        case 25..<29.9:
            return "Overweight"
        case 30..<34.9:
            return "Obese"
        default:
            return "Extremly Obese"
        }
    }
    
    func bmiScaleColor() -> Color {
        switch calculateBMI() {
        case 0..<18.5:
            return .blue
        case 18.6..<24.9:
            return .green
        case 25..<29.9:
            return .yellow
        case 30..<34.9:
            return .orange
        default:
            return .red
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(weightSlider: .constant(67.0), heightSlider: .constant(177), savedHistories: .constant([]))
    }
}

//
//  ContentView.swift
//  BMICalculatorC6N1
//
//  Created by Handy Handy on 06/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    @State var weightSlider = 76.0
    @State var heightSlider = 166.0
    @State var savedHistories = [
        BmiData(savedDate: Date(), result: 18.0),
        BmiData(savedDate: Date(), result: 24.0)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Segment", selection: $segmentIndex) {
                    Text("Calculator").tag(0)
                    Text("History").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                switch segmentIndex {
                case 0:
                    CalculatorView(
                        weightSlider: $weightSlider,
                        heightSlider: $heightSlider,
                        savedHistories: $savedHistories
                    )
                default :
                    HistoryView(
                        savedHistories: $savedHistories
                    )
                }
                
            }
            .navigationTitle(Text("Body Mass Index"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

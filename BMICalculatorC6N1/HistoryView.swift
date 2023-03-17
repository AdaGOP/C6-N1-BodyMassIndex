//
//  HistoryView.swift
//  BMICalculatorC6N1
//
//  Created by Handy Handy on 09/03/23.
//

import SwiftUI

struct HistoryView: View {
    
    @Binding var savedHistories: [BmiData]

    var body: some View {
        NavigationView {
            List(savedHistories) { savedHistory in
                NavigationLink(destination: EmptyView()) {
                    HistoryItem(bmiData: savedHistory)
                }
            }.navigationTitle("History")
        }
    }
}


struct HistoryItem: View {
    
    var bmiData: BmiData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(bmiData.savedDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.body)
                .foregroundColor(.gray)
            HStack {
                Text("\(bmiData.result, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                Spacer()
                Text("\(bmiData.bmiScale())")
                    .font(.title2)
                    .foregroundColor(bmiData.bmiScaleColor())
            }
            .padding(.top, -4)
        }
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(
            savedHistories: .constant([
                BmiData(savedDate: Date(), result: 18.0),
                BmiData(savedDate: Date(), result: 24.0)
            ])
        )
    }
}

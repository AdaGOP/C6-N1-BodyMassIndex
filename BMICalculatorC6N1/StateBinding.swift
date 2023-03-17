//
//  StateBinding.swift
//  BMICalculatorC6N1
//
//  Created by zein rezky chandra on 17/03/23.
//

import SwiftUI

struct StateView: View {
    
    @Binding var initialValue: Int
    
    var body: some View {
        Button("Increse by plus 1") {
            initialValue += 1
            print("Value in child : \(initialValue)")
        }
    }

}

struct StateBinding: View {
    @State private var initialValue = 0
    
    var body: some View {
        VStack {
            Text("Value in parent : \(initialValue)")
            StateView(initialValue: $initialValue)
        }
    }

}

struct StateBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateBinding()
    }
}

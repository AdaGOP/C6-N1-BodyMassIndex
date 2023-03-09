//
//  BmiData.swift
//  BMICalculatorC6N1
//
//  Created by Handy Handy on 09/03/23.
//

import Foundation
import SwiftUI

struct BmiData: Identifiable {
    let id = UUID()
    var savedDate: Date
    var result: Double
    
    func bmiScale() -> String {
        switch result {
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
        switch result {
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

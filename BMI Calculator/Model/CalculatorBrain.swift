//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by murad on 12.10.2024.
//

import UIKit

struct CalculatorBrain {
    private var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fir as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
    }
    
//    func getBMIValue() -> String {
//        guard let bmi else { return "0.0" }
//        let bmiTo1DecimalePlace = String(format: "%.1f", bmi.value)
//        return bmiTo1DecimalePlace
//    }
    
    func getBMIValue() -> Float {
        return bmi?.value ?? 0.0
    }
    
    func getAdvice() -> String {
        guard let bmi else { return "Error" }
        return bmi.advice
    }
    
    func getColor() -> UIColor {
        guard let bmi else { return .black }
        return bmi.color
    }
}

//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by khalil panahi on 16/10/21.
//

import UIKit

struct CalculatorBrain {
    var bmi : BMI?
    
    mutating func calculateBmi(height: Float,weight: Float ) {
        let bmiValue = weight / (height * height)
        let catadvice = getBmiCategory(calculatedBmi: bmiValue)
        let catColor = getCategoryColor(calculatedBmi: bmiValue)
        bmi = BMI(value: bmiValue, advice: catadvice, color: catColor)
    }
    
    func getBmiValue() -> String? {
        if let value = bmi?.value {
        return String(format: "%.1f",value)
        }
        return nil
    }
    
    func getBmiCategory(calculatedBmi : Float) -> String {
        if calculatedBmi < 18.5 {
            return "Underweight : Eat more pies."
        } else if calculatedBmi <= 24.9 {
            return "normal : you are handsome."
        } else if calculatedBmi > 24.9 {
            return "Overweight : Eat less pies."
        }
        return "OBESE : you are in Danger."
    }
    
    func getCategoryColor(calculatedBmi: Float) -> UIColor {
        if calculatedBmi < 18.5 {
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else if calculatedBmi <= 24.9 {
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        } else if calculatedBmi > 24.9 {
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    func getAdvice() -> String? {
        if let advice = bmi?.advice {
            return advice
        }
        return nil
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}

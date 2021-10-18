//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Khalil panahi
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sliderHeight(_ sender: UISlider) {
        labelHeight.text = String(format:"%.2f" , sender.value)
    }
    
    
    @IBAction func sliderWeight(_ sender: UISlider) {
        labelWeight.text = String(format:"%.0f" , sender.value)
    }
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBmi(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.resultAdvice = calculatorBrain.getAdvice()
            destinationVC.resultColor = calculatorBrain.getColor()
        }
    }
}


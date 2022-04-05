//
//  ViewController.swift
//  CalculatorAppSayat
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myDisplay: UILabel!
    
    var typing: Bool = false
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let current_digit = String(sender.tag)
        if typing{
            let current_display = myDisplay.text!
            myDisplay.text = current_display + current_digit
        }
        else if (current_digit == "0"){
            myDisplay.text = current_digit
        }
        else{
            myDisplay.text = current_digit
            typing = true
        }
    }
    
    var displayValue: Double{
        get{
            return Double(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue)
        }
    }
    
    private var calculatorModel = CalculatorModel()
    
    @IBAction func operationPressed(_ sender: UIButton) {
        let operation_value = String(sender.tag)
        
        if (operation_value == "11"){
            displayValue = 0
        }
        else{
            calculatorModel.setOperand(displayValue)
            calculatorModel.performOperation(operation_value)
            displayValue = calculatorModel.result!
        }
        
        typing = false
    }
    
}


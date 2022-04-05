//
//  CalcModel.swift
//  CalculatorAppSayat
//

import Foundation

enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double,Double)->Double)
    case equals
}

func addition(op1: Double, op2: Double)-> Double{
    return op1+op2
}

struct CalculatorModel{
    var my_operation: Dictionary<String,Operation> =
    [
        "14": Operation.binaryOperation({$0/$1}),
        "15": Operation.binaryOperation({$0*$1}),
        "16": Operation.binaryOperation({$0-$1}),
        "17": Operation.binaryOperation(addition),
        "18": Operation.equals
    ]
    
    private var global_value: Double?
    
    mutating func setOperand(_ operand: Double){
        global_value = operand
    }
    
    mutating func performOperation(_ operation: String){
        let symbol = my_operation[operation]
        switch symbol{
        case .binaryOperation(let function):
            saving = SaveFirstOperandAndOperation(firstOperand: global_value!, operation: function)
            
        case .equals:
            global_value = saving?.performOperationWith(secondOperand: global_value!)
            
        default:
            break
        }
        
    }
    
    var result: Double?{
        get{
            return global_value
        }
    }
    
}

private var saving: SaveFirstOperandAndOperation?

struct SaveFirstOperandAndOperation{
    var firstOperand: Double
    var operation: (Double,Double)-> Double
    
    func performOperationWith(secondOperand op2: Double)-> Double{
        return operation(firstOperand,op2)
    }
}



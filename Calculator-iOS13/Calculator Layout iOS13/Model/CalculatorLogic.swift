//
//  CalculatorLogic.swift
//  Calculator Layout iOS13
//
//  Created by Ashish Kumar on 16/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    var number: Double? //78    3
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
                                          //  78          +
    mutating func setNumber(_ number: Double) {
           self.number = number
       }
    
    
    mutating func calculate(symbol: String) -> Double? {
       
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n) // 3
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }

    
}

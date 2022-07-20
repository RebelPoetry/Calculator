//
//  RPNEvaluator.swift
//  Calculator
//
//  Created by Kazakh on 20.07.2022.
//

import Foundation

// MARK: - RPNEvaluator

final class RPNEvaluator {
    
}

// MARK: - Evaluator

extension RPNEvaluator: Evaluator {
    
    /// Evaluate RPNExpression and returns Double value 
    func evaluate(_ expression: [MathExpressionToken]) -> Double {
        var stack = Stack<Double>()
        
        for element in expression {
            switch element {
            case .number(let number):
                stack.push(number)
            case .binaryOperation:
                guard
                    let num2 = stack.pop(),
                    let num1 = stack.pop()
                else { continue }
                switch element {
                case .binaryOperation(.addition):
                    stack.push(num1 + num2)
                case .binaryOperation(.subtruction):
                    stack.push(num1 - num2)
                case .binaryOperation(.multiplication):
                    stack.push(num1 * num2)
                case .binaryOperation(.division):
                    stack.push(num1 / num2)
                case .binaryOperation(.power):
                    stack.push(pow(num1, num2))
                default:
                    print("Встречен некорректный символ")
                }
            default:
                print("Будем верить, что до этого не дойдет")
            }
        }
        return Double(String(format: "%.3f", stack.pop()!)) ?? 0
    }
}

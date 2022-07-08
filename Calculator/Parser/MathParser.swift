//
//  Parser.swift
//  Calculator
//
//  Created by Kazakh on 05.07.2022.
//

import Foundation

// MARK: - MathExpressionParser

/// Parse the given math expression and returns tokens sequence
final class MathExpressionParser: ExpressionParser {

    func parse(_ expression: String) -> [MathExpressionToken] {
        
       var str = expression
       var result: [MathExpressionToken] = []
       var number = ""
        
       while !str.isEmpty {
           let a = String(str.removeFirst())
           if Int(a) != nil || a == "." {
               number += a
           } else {
               if let number = Double(number) {
                   result.append(.number(number))
               }
               number = ""
               if let operation = BinaryOperation(rawValue: a) {
                   result.append(.binaryOperation(operation))
               }
           }
       }
       if let number = Double(number) {
           result.append(.number(number))
       }
       return result
    }
}

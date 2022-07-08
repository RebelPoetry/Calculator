//
//  Parser.swift
//  Calculator
//
//  Created by Kazakh on 05.07.2022.
//

import Foundation

// MARK: - ExpressionParser

protocol ExpressionParser {

    /// Parse the given expression and returns tokens sequence
    /// - Parameter expression: target expression
    /// - Returns: result tokens sequence
    func parse(_ expression: String) -> [Token]
}

// MARK: - Parse

class MathExpressionParser: ExpressionParser {
    
    /// The function that parse an math expression to a tokens seequence
    func parse(_ expression: String) -> [Token] {
        
       var str = expression
       var result: [Token] = []
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

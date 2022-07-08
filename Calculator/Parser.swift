//
//  Parser.swift
//  Calculator
//
//  Created by Kazakh on 05.07.2022.
//

import Foundation

// MARK: - ExpressionParser

protocol ExpressionParser {
    
    /// The type of  returned sequence
    associatedtype TypeOfSequence
    
    /// Parse the given String expression and returns  sequence
    /// - Parameter expression: target String  expression
    /// - Returns: result  sequence
    func parse(_ expression: String) -> [TypeOfSequence]
}

// MARK: - MathExpressionParser

/// Parse the given math expression and returns tokens sequence
class MathExpressionParser: ExpressionParser {

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

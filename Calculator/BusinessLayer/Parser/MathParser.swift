//
//  Parser.swift
//  Calculator
//
//  Created by Kazakh on 05.07.2022.
//

import Foundation

// MARK: - MathExpressionParser

final class MathExpressionParser: ExpressionParser {
    
    /// Parse the given math expression and returns tokens sequence
    func parse(_ expression: String) throws -> [MathExpressionToken] {
        
        var str = expression.filter { $0 != " " }
        var result: [MathExpressionToken] = []
        var number = ""
        
        while !str.isEmpty {
            
            let a = String(str.removeFirst())
            
            if Int(a) != nil || a == "." {
                number += a
            } else {
                guard String(number).filter({ $0 == "."}).count < 2 else {
                    throw MathParserError.lotsOfPoints
                }
                guard String(number).first != "." else {
                    throw MathParserError.pointBeforeNumber
                }
                if let number = Double(number) {
                    result.append(.number(number))
                }
                number = ""
                guard BinaryOperation.init(rawValue: a) != nil || Brackets.init(rawValue: a) != nil else {
                    throw MathParserError.unknownCharacter(a)
                }
                if let operation = BinaryOperation(rawValue: a) {
                    result.append(.binaryOperation(operation))
                } else if let brackett = Brackets(rawValue: a) {
                    result.append(.bracket(brackett))
                }
            }
        }
        if let number = Double(number) {
            result.append(.number(number))
        }
        return result
    }
}

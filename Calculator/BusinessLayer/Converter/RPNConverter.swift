//
//  RPNConventer.swift
//  Calculator
//
//  Created by Kazakh on 08.07.2022.
//

import Foundation

// MARK: - RPNConverter

final class RPNConverter {
    
}

// MARK: - Converter

extension RPNConverter: Converter {
    
    /// Convert the given math expression to RPN expression
    func convert(_ expression: [MathExpressionToken]) -> [MathExpressionToken] {
        
        var result: [Token] = []

        var stack = Stack<Token>()

        for element in expression {
            switch element {
            case .number:
                result.append(element)
            case .bracket(.openingBracket):
                stack.push(element)
            case .bracket(.closingBracket):
                while let top = stack.pop(), top != .bracket(.openingBracket) {
                    result.append(top)
                }
            case .binaryOperation(let currentOperation):
                while let top = stack.peek() {
                    if case let .binaryOperation(topOperation) = top, topOperation.priority >= currentOperation.priority {
                        result.append(top)
                        stack.pop()
                    } else {
                        break
                    }
                }
                stack.push(element)
            }
        }
        while let top = stack.pop() {
            result.append(top)
        }
        return result
    }
}

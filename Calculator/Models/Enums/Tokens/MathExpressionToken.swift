//
//  MathExpressionToken.swift
//  Calculator
//
//  Created by Kazakh on 08.07.2022.
//

import Foundation

// MARK: - Token

enum MathExpressionToken: Equatable, CustomDebugStringConvertible {

    // MARK: - Cases
    
    case number(Double)
    case binaryOperation(BinaryOperation)
    case bracket(Brackets)
    
    // MARK: - CustomDebugStringConvertible
    
    var debugDescription: String {
        switch self {
        case .number(let double):
            return String(double)
        case .binaryOperation(let binaryOperation):
            return binaryOperation.rawValue
        case .bracket(let bracket):
            return bracket.rawValue
        }
    }
}

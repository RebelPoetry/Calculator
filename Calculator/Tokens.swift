//
//  Tokens.swift
//  Calculator
//
//  Created by Kazakh on 04.07.2022.
//

import Foundation

// MARK: - Token

enum Token: Equatable, CustomDebugStringConvertible {

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

// MARK: - BinaryOpearation

enum BinaryOperation: String, CaseIterable, Equatable {

    // MARK: - Cases
    
    case power = "^"
    case division = "/"
    case addition = "+"
    case subtruction = "-"
    case multiplication = "×"

    // MARK: - Properties
    
    var priority: Int {
        switch self {
        case .addition, .subtruction:
            return 1
        case .division, .multiplication:
            return 2
        case .power:
            return 3
        }
    }
}

// MARK: - Brackets

enum Brackets: String, Equatable {
    case openingBracket = "("
    case closingBracket = ")"
}

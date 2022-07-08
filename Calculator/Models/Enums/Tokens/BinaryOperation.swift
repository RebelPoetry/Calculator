//
//  BinaryOperationToken.swift
//  Calculator
//
//  Created by Kazakh on 08.07.2022.
//

import Foundation

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

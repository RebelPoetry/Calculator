//
//  RPNConverterError.swift
//  Calculator
//
//  Created by Kazakh on 09.07.2022.
//

import Foundation

// MARK: - MathParserError

enum MathParserError {

    case unknownCharacter(String)
    case unknownError
    case other(String)
    case lotsOfPoints
    case pointBeforeNumber
}

// MARK: - LocalizedError

extension MathParserError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .unknownCharacter:
            return """
                Unknown character found 
                Right now the Calculator supports this symbols:
                +, -, ×, /, ^, (, )
                Your symbol will be able coming soon
            """
        case .unknownError:
            return "Unknown error"
        case .other(let errorText):
            return errorText
        case .lotsOfPoints:
            return "More than 1 point in a number"
        case .pointBeforeNumber:
            return "Found point before a number"
        }
    }
}

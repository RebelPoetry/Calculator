//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Kazakh on 08.07.2022.
//

import Foundation

// MARK: - ExpressionParser

protocol ExpressionParser {
    
    /// The type of returned sequence
    associatedtype Token
    
    /// Parse the given String expression and returns sequence
    /// - Parameter expression: target String expression
    /// - Returns: result  sequence
    func parse(_ expression: String) throws -> [Token]
}

//
//  Evaluator.swift
//  Calculator
//
//  Created by Kazakh on 20.07.2022.
//

import Foundation

// MARK: - Evaluator

protocol Evaluator  {
    
    /// The type of given and returned sequence
    associatedtype Token
    
    /// Evaluate the given expression and returns Double value
    /// - Parameter expression: Token  array
    /// - Returns: Double
    /// - Example: Evaluate RPN expression
    func evaluate(_ expression: [Token]) -> Double
}

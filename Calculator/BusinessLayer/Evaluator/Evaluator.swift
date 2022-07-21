//
//  Evaluator.swift
//  Calculator
//
//  Created by Kazakh on 20.07.2022.
//

import Foundation

// MARK: - Evaluator

protocol Evaluator  {
    
    /// Token type for any input sequence
    associatedtype Token
    
    func evaluate(_ expression: [Token]) -> Double
}

//
//  Converter.swift
//  Calculator
//
//  Created by Kazakh on 08.07.2022.
//

import Foundation

// MARK: - Converter

protocol Converter {
    
    /// The type of given and returned sequence
    associatedtype Token
    
    /// Convert the given sequence and returns it
    /// - Parameter expression: target  sequence
    /// - Returns: result  sequence
    /// - Example: parsed string to RPN string
    func convert(_ expression: [Token]) -> [Token]
}

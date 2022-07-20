//
//  RPNEvaluatorTests.swift
//  CalculatorTests
//
//  Created by Kazakh on 20.07.2022.
//
@testable import Calculator
import XCTest

class RPNEvaluatorTests: XCTestCase {
    
    private let converter = RPNConverter()
    private let evaluator = RPNEvaluator()
    private let parser = MathExpressionParser()
    
    func testSomething() throws {
        
        /// given
        let testDictionary: [String: Double] = [
            "10 + 205 × 3000 / 5" : 123010,
            "2 ^ 7 / 4" : 32,
            "85 - 100 + 0" : -15,
            "3 ^ 3 ^ 2" : 729,
            "90 / 90 + 80" : 81,
            "50.34 - 0.34" : 50,
            "1 - 2.3" : -1.3
        ]
        
        for (expression, expected) in testDictionary {
            let parsedExpression = try parser.parse(expression)
            let convertedExpression  = converter.convert(parsedExpression)
            let evaluatedExpression = evaluator.evaluate(convertedExpression)
            
            XCTAssertEqual(evaluatedExpression, expected)
            }
        }

    }


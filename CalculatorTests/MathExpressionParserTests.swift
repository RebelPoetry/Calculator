@testable import Calculator
import XCTest

class MathExpressionParserTests: XCTestCase {

    private let parser = MathExpressionParser()
    
    func testSomething() throws {
        
        /// given
        let testDictionary: [String: [MathExpressionToken]] = [
            "10 + 205.3 × 3000 / 4.1": [
                .number(10),
                .binaryOperation(.addition),
                .number(205.3),
                .binaryOperation(.multiplication),
                .number(3000),
                .binaryOperation(.division),
                .number(4.1)
            ],
            "2345.234 + 56 / 2 / 28 × 3": [
                .number(2345.234),
                .binaryOperation(.addition),
                .number(56),
                .binaryOperation(.division),
                .number(2),
                .binaryOperation(.division),
                .number(28),
                .binaryOperation(.multiplication),
                .number(3)
            ],
            "59 ^ 2 ^ 2 / 100 + 185.908": [
                .number(59),
                .binaryOperation(.power),
                .number(2),
                .binaryOperation(.power),
                .number(2),
                .binaryOperation(.division),
                .number(100),
                .binaryOperation(.addition),
                .number(185.908),
            ],
            "105 × 0.2 / 03 + 0506": [
                .number(105),
                .binaryOperation(.multiplication),
                .number(0.2),
                .binaryOperation(.division),
                .number(3),
                .binaryOperation(.addition),
                .number(506)
            ],
            "105 + 345 × 54 / 57 - 504.4 ^ 2": [
                .number(105),
                .binaryOperation(.addition),
                .number(345),
                .binaryOperation(.multiplication),
                .number(54),
                .binaryOperation(.division),
                .number(57),
                .binaryOperation(.subtruction),
                .number(504.4),
                .binaryOperation(.power),
                .number(2),
            ],
            "88005553535 - 800000000 + 0000": [
                .number(88005553535),
                .binaryOperation(.subtruction),
                .number(800000000),
                .binaryOperation(.addition),
                .number(0),
                
            ],
            "123 - 321 × 2890 - 3094": [
                .number(123),
                .binaryOperation(.subtruction),
                .number(321),
                .binaryOperation(.multiplication),
                .number(2890),
                .binaryOperation(.subtruction),
                .number(3094),
                
            ],
            "0 + 00 + 000 + 0000 + 00000": [
                .number(0),
                .binaryOperation(.addition),
                .number(0),
                .binaryOperation(.addition),
                .number(0),
                .binaryOperation(.addition),
                .number(0),
                .binaryOperation(.addition),
                .number(0)
            ],
            "1024 / 2 / 2 / 2": [
                .number(1024),
                .binaryOperation(.division),
                .number(2),
                .binaryOperation(.division),
                .number(2),
                .binaryOperation(.division),
                .number(2)
            ],
            "123 + - 234": [
                .number(123),
                .binaryOperation(.addition),
                .binaryOperation(.subtruction),
                .number(234)
            ]
        ]
        
        for (expression, expected) in testDictionary {
            let parsedExpression = try parser.parse(expression)
            XCTAssertEqual(parsedExpression.count, expected.count)
            
            for (before, after) in zip(parsedExpression, expected) {
                XCTAssertEqual(before, after)
            }
        }

    }
}
 /* /// when
  let parsedTokens = try parser.parse(expression)
  
  /// then
  XCTAssertEqual(expectedTokens.count, parsedTokens.count)
  for (expected, parsed) in zip(expectedTokens, parsedTokens) {
      XCTAssertEqual(expected, parsed)
  }*/

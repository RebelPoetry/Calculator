
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


enum MathExpressionToken: CustomDebugStringConvertible {

    // MARK: - Cases
    
    case number(Double)
    case binaryOperation(BinaryOperation)
    
    // MARK: - CustomDebugStringConvertible
    
    var debugDescription: String {
        switch self {
        case .number(let double):
            return String(double)
        case .binaryOperation(let binaryOperation):
            return binaryOperation.rawValue
        }
    }
}

let a = "1 2  3"
print(a.filter { $0 != " " })


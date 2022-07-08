//
//  Stack.swift
//  Calculator
//
//  Created by Kazakh on 03.07.2022.
//

import Foundation

// MARK: - Stack

struct Stack<Element> {

    // MARK: - Properties

    /// Stack elements holder
    var array: [Element] = []

    /// Checks if the array is empty
    var isEmpty: Bool {
        array.isEmpty
    }

    /// Elements count
    var count: Int {
        array.count
    }

    // MARK: - Useful

    /// Push a new element to the stack
    /// - Parameter element: a new element
    mutating func push(_ element: Element) {
        array.append(element)
    }

    /// Pop the top element from the stack
    /// - Returns: the top element from the stack
    @discardableResult mutating func pop() -> Element? {
        array.popLast()
    }

    /// Return a top element from the stack
    /// - Returns: a top element from the stack
    func peek() -> Element? {
        array.last
    }
}

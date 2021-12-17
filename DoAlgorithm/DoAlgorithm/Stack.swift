//
//  Stack.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/17.
//

import Foundation
class Stack {
    func isValid(_ s: String) -> Bool {
        let dict: [Character:Character] = ["(":")","[":"]","{":"}"]
        var stack: [Character] = []
        for c in s {
            if dict.keys.contains(c) {
                stack.append(c)
            } else if stack.isEmpty {
                return false
            } else if c == dict[stack.last!] {
                stack.removeLast()
            } else {
                return false
            }
        }
        return stack.isEmpty
    }
}

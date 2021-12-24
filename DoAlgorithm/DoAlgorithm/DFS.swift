//
//  DFS.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/21.
//

import Foundation
import UIKit
class DFS {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        var trace: String = ""
        generateParenthesis(2*n,&trace,&result)
        return result
    }
    
    func generateParenthesis(_ n: Int, _ trace: inout String, _ result: inout [String]) {
        if trace.count == n {
            if isValid(trace) {
                result.append(trace)
            }
            return
        }
        let items: [Character] = ["(",")"]
        for item in items {
            trace.append(item)
            generateParenthesis(n, &trace, &result)
            trace.removeLast()
        }
    }
    
    func isValid(_ str: String) -> Bool {
        var stack: [Character] = []
        for char in Array(str) {
            if char == "(" {
                stack.append(char)
            } else if stack.isEmpty {
                return false
            } else if stack.last == "(" {
                stack.removeLast()
            } else {
                return false
            }
        }
        return stack.isEmpty
    }
    
    //Q46
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var array: [Int] = []
        permute(nums, &array, &result)
        return result
    }
    
    func permute(_ nums: [Int], _ array: inout [Int], _ result: inout [[Int]]) {
        if array.count == nums.count {
            result.append(array)
            return
        }
        for num in nums {
            if array.contains(num) {
                continue
            }
            array.append(num)
            permute(nums, &array, &result)
            array.removeLast()
        }
    }
}

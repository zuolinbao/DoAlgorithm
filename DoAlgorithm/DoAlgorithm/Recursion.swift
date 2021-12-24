//
//  Recursion.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/21.
//

import Foundation
class Recursion {
    func climbStairs(_ n: Int) -> Int {
        if n < 2 {
            return 1
        }
        var a = 1
        var b = 1
        for _ in 2...n {
            let newA = b
            b = a + b
            a = newA
        }
        return b
    }
}

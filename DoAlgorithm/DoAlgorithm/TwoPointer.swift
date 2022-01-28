//
//  TwoPointer.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/16.
//

import Foundation
class TwoPointer {
    func longestPalindrome(_ s: String) -> String {
        let array = Array(s)
        var result = ""
        for (index,_) in array.enumerated() {
            let str1 = longestPalindrome(s, index, index)
            let str2 = longestPalindrome(s, index, index+1)
            result = str1.count > result.count ? str1 : result
            result = str2.count > result.count ? str2 : result
        }
        return result
    }
    
    //Q28
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == "" {
            return 0
        }
        for (index,cH) in haystack.enumerated() {
            guard haystack.count-index >= needle.count else {
                return -1
            }
            if cH == needle.first {
                for (indexN,cN) in needle.enumerated() {
                    let val = haystack[haystack.index(haystack.startIndex, offsetBy: index+indexN)]
                    if indexN == needle.count-1 && cN == val {
                        return index
                    }
                    if cN != val {
                        break
                    }
                }
            }
        }
        return -1
    }
    
    func longestPalindrome(_ s: String, _ left: Int, _ right:Int) -> String {
        let array = Array(s)
        if left + 1 == array.count || array[left] != array[right] {
            return String(array[left])
        }
        var r = right
        var l = left
        while array[l] == array[r]  && r + 1 < array.count && l > 0  {
            r += 1
            l -= 1
        }
        if l < 0 && r + 1 > array.count {
            r -= 1
            l += 1
        }
        if array[l] != array[r] && r >= l + 2 {
            r -= 1
            l += 1
        }
        return String(array[l...r])
    }
}

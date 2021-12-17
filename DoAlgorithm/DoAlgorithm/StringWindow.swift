//
//  StringWindow.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/16.
//

import Foundation


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var windowString = ""
        var length = 0
        for c in s {
            if !windowString.contains(c) {
                windowString.append(c)
            } else {
                length = max(length, windowString.count)
                let uper =  windowString.range(of: String(c))!.upperBound
                windowString.removeSubrange(windowString.startIndex..<uper)
                windowString.append(c)
            }
        }
        return max(length, windowString.count)
    }

}

class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var window: [Character:Int] = [:]
        var left = 0
        var right = 0
        var start = 0
        var length = 0
        while right < s.count {
            let rightC = s[s.index(s.startIndex, offsetBy: right)]
            if window[rightC] != nil {
                window[rightC]! += 1
            } else {
                window[rightC] = 1
            }
            right += 1
            if isValid(window) {
                let windowLength = right - left
                if windowLength > length {
                    start = left
                    length = windowLength
                    let startIndex = s.index(s.startIndex, offsetBy: start)
                    let subString = s[startIndex..<s.index(startIndex, offsetBy: length)]
                    print("\(subString)\n")
                }
            }
            while left < right && !isValid(window) {
                let leftC = s[s.index(s.startIndex, offsetBy: left)]
                window[leftC]! -= 1
                left += 1
            }
            
        }
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let subString = s[startIndex..<s.index(startIndex, offsetBy: length)]
        print("result is \(subString)")
        return length
    }
    
    func isValid(_ window: [Character:Int]) -> Bool {
        var flag = true
        for (_,value) in window {
            if value > 1 {
                flag = false
                break
            }
        }
        return flag
    }
}


class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var right = 0
        var window: [Character:Int] = [:]
        var length = 0
        while right < s.count {
            let charR = s[s.index(s.startIndex, offsetBy: right)]
            while let charNum = window[charR], charNum == 1 {
                let charL = s[s.index(s.startIndex, offsetBy: left)]
                window[charL]! -= 1
                left += 1
            }
            window[charR] = 1
            right += 1
            length = max(length, right - left)
        }
        return length
    }
    
    
}




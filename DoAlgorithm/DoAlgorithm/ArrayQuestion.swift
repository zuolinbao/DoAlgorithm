//
//  Array.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/17.
//

import Foundation
class ArrayQuestion {
    //Q11
    func maxArea(_ height: [Int]) -> Int {
        var result = Int.min
        for leftIndex in 0..<height.count-1 {
            for rightIndex in (leftIndex+1)..<height.count {
               result = max(min(height[leftIndex], height[rightIndex])*(rightIndex-leftIndex), result)
            }
        }
        return result
    }
    //Q26
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var newIndex = 0
        for num in nums {
            if num != nums[newIndex] {
                newIndex += 1
                nums[newIndex] = num
            }
        }
        if newIndex > 0 {
            if nums[newIndex] == nums[newIndex - 1] {
                newIndex -= 1
            }
        }
        if newIndex + 1 < nums.count {
            nums.removeSubrange(newIndex+1..<nums.count)
        } else {
            
        }
        return nums.count
    }
    
    //Q27
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var indexV = 0
        for num in nums {
            if num != val {
                nums[indexV] = num
                indexV += 1
            }
        }
        if indexV < nums.count {
            nums.removeSubrange(indexV..<nums.count)
        }
        return nums.count
    }
    
    //Q34
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = -1
        var right = -1
        for (index,val) in nums.enumerated() {
            if val == target {
                if left == -1 {
                    left = index
                } else {
                    right = index
                }
            }
            if val > target {
                break
            }
        }
        if left != -1 && right == -1 {
            return [left,left]
        }
        return [left,right]
    }
    
    //Q42
    func trap(_ height: [Int]) -> Int {
        var leftMaxs: [Int] = []
        var rightMaxs: [Int] = []
        for h in height {
            if leftMaxs.isEmpty {
                leftMaxs.append(h)
            } else if h > leftMaxs.last! {
                leftMaxs.append(h)
            } else {
                leftMaxs.append(leftMaxs.last!)
            }
        }
        for h in height.reversed() {
            if rightMaxs.isEmpty {
                rightMaxs.append(h)
            } else if h > rightMaxs.first! {
                rightMaxs.insert(h, at: 0)
            } else {
                rightMaxs.insert(rightMaxs.first!, at: 0)
            }
        }
        var result = 0
        for (index,val) in height.enumerated() {
            result += min(leftMaxs[index], rightMaxs[index]) - val
        }
        return result
    }
    
    //Q136
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    
    
    func test() {
        var nums: [Int] = [0,1,2,2,3,0,4,2]
        var _ = ArrayQuestion().removeElement(&nums, 2)
    }
}

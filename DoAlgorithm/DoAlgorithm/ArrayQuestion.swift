//
//  Array.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/17.
//

import Foundation
class ArrayQuestion {
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
    
    
    func test() {
        var nums: [Int] = [0,1,2,2,3,0,4,2]
        ArrayQuestion().removeElement(&nums, 2)
    }
}

//
//  ListNode.swift
//  DoAlgorithm
//
//  Created by zuo on 2021/12/21.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head else {
            return false
        }
        var fast = head
        var low = head
        while fast.next != nil {
            guard fast.next != nil else {
                return false
            }
            fast = fast.next!
            guard fast.next != nil else {
                return false
            }
            fast = fast.next!
            guard low.next != nil else {
                return false
            }
            low = low.next!
            if fast === low {
                return true
            }
        }
        return false
    }
    
    
    //Q23
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists2 = lists
        let headNode = ListNode.init(Int.max)
        var currentNode = headNode
        var emptyCount = 0
        var smallNode = ListNode.init(Int.max)
        while emptyCount < lists2.count {
            emptyCount = 0
            var smallIndex = 0
            for (index,list) in lists2.enumerated() {
                if list == nil {
                    emptyCount += 1
                    continue
                }
                if list!.val < smallNode.val {
                    smallNode = list!
                    smallIndex = index
                }
                
            }
            if lists2[smallIndex]!.next != nil {
                lists2[smallIndex] = lists2[smallIndex]!.next
            }
            currentNode.next = smallNode
            currentNode = currentNode.next!
        }
        return headNode.next
    }
}


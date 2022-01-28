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
    //Q23
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
    
    //Q203
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let node = head else { return nil }
        let newHead = ListNode.init(Int.min)
        var p = newHead
        p.next = node
        while p.next != nil {
            if p.next!.val != val {
                p = p.next!
            } else {
                var q = p.next
                while q != nil && q!.val == val {
                    q = q!.next
                }
                p.next = q
            }
        }
        return newHead.next
    }
    
    //Q234
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else {
            return false
        }
        var slow = head
        var fast = head
        while fast?.next != nil {
            fast = fast?.next?.next
            if fast == nil {
                break
            }
            slow = slow?.next
        }
        var headR: ListNode?
        if fast == nil {
            headR = reverseList(slow?.next)
        } else {
            headR = reverseList(slow)
        }
        var headP = head
        while headP != nil && headR != nil {
            if headP!.val == headR!.val {
                headP = headP?.next
                headR = headR?.next
            } else {
                return false
            }
        }
        return true
    }
    
    
    //Q876
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        if head?.next?.next == nil {
            return head?.next
        }
        var slow = head
        var fast = head
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        if fast?.next == nil {
            return slow
        }
        return slow?.next
    }

}


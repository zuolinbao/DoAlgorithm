//
//  Tree.swift
//  DoAlgorithm
//
//  Created by zuo on 2022/1/17.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Tree {
    //Q94
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        var nodes: [Int] = []
        nodes += inorderTraversal(node.left)
        nodes.append(node.val)
        nodes += inorderTraversal(node.right)
        return nodes
    }
    
    //Q98
    func isValidBST(_ root: TreeNode?) -> Bool {
        let nodes: [Int] = inorderTraversal(root)
        let nodeSet = Set.init(nodes)
        if nodeSet.count != nodes.count {
            return false
        }
        return  nodes.sorted() == nodes
    }
    
    //Q101
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetric(root?.left, root?.right)
    }
    
    func isSymmetric(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        guard p != nil && q != nil else {
            return false
        }
        return p!.val==q!.val && isSymmetric(p?.left, q?.right) && isSymmetric(p?.right, q?.left)
    }
    
    //Q102
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(node)
        while !queue.isEmpty {
            var size = queue.count
            var nodes: [Int] = []
            while size > 0 {
                let node = queue.first!
                nodes.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                queue.removeFirst()
                size -= 1
            }
            result.append(nodes)
        }
        return result
    }
    
    //Q100
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p != nil && q != nil {
            return p!.val==q!.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false
    }
    
    //Q104
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        return max(maxDepth(node.left), maxDepth(node.right)) + 1
    }
    
    //Q105
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.first != nil else { return nil }
        let root = TreeNode.init(preorder.first!)
        guard preorder.count > 1 else {
            return root
        }
        var leftPreArray: [Int] = []
        var rightPreArray: [Int] = []
        var leftInArray: [Int] = []
        var rightInArray: [Int] = []
        for (index,val) in inorder.enumerated() {
            if val == root.val {
                let leftLength = index
                let rightLength = inorder.count - 1 - index
                if leftLength > 0 {
                    leftInArray = Array(inorder[0..<leftLength])
                    leftPreArray = Array(preorder[1...leftLength])
                } else {
                    rightInArray = []
                    rightPreArray = []
                }
                if rightLength > 0 {
                    rightInArray = Array(inorder[leftLength+1..<inorder.count])
                    rightPreArray = Array(preorder[leftLength+1..<inorder.count])
                } else {
                    rightInArray = []
                    rightPreArray = []
                }
                root.left = buildTree(leftPreArray, leftInArray)
                root.right = buildTree(rightPreArray, rightInArray)
            }
        }
        return root
    }
    
    //Q111
    func minDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        if node.left == nil {
            return 1 + minDepth(node.right)
        }
        if node.right == nil {
            return 1 + minDepth(node.left)
        }
        return 1 + min(minDepth(node.left), minDepth(node.right))
    }

    
    
    //Q114
    func flatten(_ root: TreeNode?) {
        guard let node = root else { return }
        flatten(node.left)
        flatten(node.right)
        guard var left = node.left else {
            return
        }
        node.left = nil
        guard let right = node.right else {
            node.right = left
            return
        }
        node.right = left
        while left.right != nil {
            left = left.right!
        }
        left.right = right
    }
    
    //Q116
    func connect(_ root: Node?) -> Node? {
        guard let node = root else { return nil }
        connectTwoNode(node.left, node.right)
        return node
    }
    
    func connectTwoNode(_ left: Node?,_ right: Node?) {
        guard left != nil && right != nil else { return }
        left?.next = right
        connectTwoNode(left?.left, left?.right)
        connectTwoNode(left?.right, right?.left)
        connectTwoNode(right?.left, right?.right)
    }
    
    //Q144
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        var nodes: [Int] = []
        nodes.append(node.val)
        nodes += preorderTraversal(node.left)
        nodes += preorderTraversal(node.right)
        return nodes
    }
    
    //Q226
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1+countNodes(root?.left)+countNodes(root?.right)
    }
    
    //Q226
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }
        let right = invertTree(node.right)
        node.right = invertTree(node.left)
        node.left = right
        return node
    }
    
    //Q230
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let node = root else { return 0 }
        return midOrder(node)[k-1]
    }
    
    func midOrder(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        return midOrder(node.left) + [node.val] + midOrder(node.right)
    }
    
    //Q236
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let pathP = lowestCommonAncestor(root, p)
        let pathQ = lowestCommonAncestor(root, q)
        if pathP.isEmpty || pathQ.isEmpty {
            return nil
        }
        var node: TreeNode?
        for index in 0..<min(pathP.count, pathQ.count) {
            if pathP[index] === pathQ[index] {
                node = pathP[index]
            } else {
                break
            }
        }
        return node
    }
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?) -> [TreeNode] {
        guard let node = root else { return [] }
        guard let endP = p else { return [] }
        if node === endP {
            return [node]
        }
        let leftArray = lowestCommonAncestor(node.left, endP)
        let rightArray = lowestCommonAncestor(node.right, endP)
        if !leftArray.isEmpty {
            return [node] + leftArray
        }
        if !rightArray.isEmpty {
            return [node] + rightArray
            
        }
        return []
    }

    
    func aTree() -> TreeNode? {
        let root = TreeNode.init(1, nil, nil)
        var node: TreeNode? = root
        for val in 2...3 {
            if val % 2 == 0 {
                let left = TreeNode.init(val, nil, nil)
                node?.left = left
                node = node?.left
            } else {
                let right = TreeNode.init(val, nil, nil)
                node?.right = right
                node = node?.right
            }
            
        }
        
        return root
    }
    
}

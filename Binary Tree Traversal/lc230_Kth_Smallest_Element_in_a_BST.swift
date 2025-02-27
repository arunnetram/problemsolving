//
//  lc230_Kth_Smallest_Element_in_a_BST.swift
//  
//
//  Created by Arun Sharma on 27/02/25.
//

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    // Iterative solution
    // solves using stack
    /*
    var n = 0
    var stack: [TreeNode] = []
    var current: TreeNode? = root
    
    while !stack.isEmpty || current != nil {
        while let node = current {
            stack.append(node)
            current = node.left
        }
        current = stack.popLast()
        n += 1
        if n == k {
            guard let current = current else { return 0 }
            return current.val
        }
        current = current?.right
    }
    return 0
     */
    
    // Recursive solution
    var count = k
    var answer = 0
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        dfs(node.left)
        count -= 1
        if count == 0 {
            answer = node.val
            return
        }
        dfs(node.right)
    }
    dfs(root)
    return answer
    
    // Both approaches are using inorder traversal
}

let left = TreeNode(11)
let right = TreeNode(66)
left.left = TreeNode(7)
left.right = TreeNode(13)
left.left?.left = TreeNode(5)

let result = Solution().kthSmallest(TreeNode(15, left, right), 3)
print(result)

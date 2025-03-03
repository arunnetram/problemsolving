//
//  lc102_Binary_Tree_Level_Order_Traversal.swift
//  
//
//  Created by Arun Sharma on 03/03/25.
//

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue: [TreeNode] = [root]
    var result: [[Int]] = []
    
    while !queue.isEmpty {
        var currentLevel: [Int] = []
        let levelSize = queue.count
        
        for i in 0..<levelSize {
            let node = queue.removeFirst()
            currentLevel.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        if currentLevel.count != 0 {
            result.append(currentLevel)
        }
    }
    return result
}

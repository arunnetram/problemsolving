//
//  lc124_Binary_Tree_Maximum_Path_Sum.swift
//  
//
//  Created by Arun Sharma on 27/02/25.
//

import Foundation

func maxPathSum(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var result = [root.val]
    
    // return max path sum without split
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0}
        
        var leftMax = dfs(root.left)
        var rightMax = dfs(root.right)
        
        // the above 2 could be negative so update them
        leftMax = max(0, leftMax)
        rightMax = max(0, rightMax)
        
        // compute max path sum WITH split
        result[0] = max(result[0], root.val + leftMax + rightMax)
        
        return root.val + max(leftMax, rightMax)
    }
    dfs(root)
    return result[0]
}

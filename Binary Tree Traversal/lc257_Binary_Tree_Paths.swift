//
//  lc257_Binary_Tree_Paths.swift
//  
//
//  Created by Arun Sharma on 27/02/25.
//

import Foundation

// Definition for a binary tree node.
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

// PreOrder = root -> left -> right
// InOrder = left -> root -> right
// PostOrder = left -> right -> root

class Solution {
    
    func findPaths(_ node: TreeNode?, _ result: inout [String], _ path: inout String) -> Void {
        guard let node = node else {
            return
        }
        
        path.append("\(node.val)")
        
        if let left = node.left {
            path.append("->")
            findPaths(left, &result, &path)
        } else if let right = node.right {
            path.append("->")
            findPaths(right, &result, &path)
        } else if node.left == nil && node.right == nil {
            path.append("")
            result.append(path)
        }
    }
   func binaryTreePaths(_ root: TreeNode?) -> [String] {
/*
       var orderedTreePaths: [String] = []
       
       guard let root = root else {
           return orderedTreePaths
       }
       
       if let left = root.left {
           let leftPaths = binaryTreePaths(left)
           for path in leftPaths {
               orderedTreePaths.append("\(root.val)->\(path)")
           }
       }
       
       if let right = root.right {
           let rightPaths = binaryTreePaths(right)
           for path in rightPaths {
               orderedTreePaths.append("\(root.val)->\(path)")
           }
       }
       
       if root.left == nil && root.right == nil {
           orderedTreePaths.append("\(root.val)")
       }
       
       return orderedTreePaths
 */
       var ans = [String]()

               func backtrack(_ node: TreeNode?, _ path: [String]) {
                   guard let node else { return }

                   print(node.val)

                   var newPath = path
                   newPath.append(String(node.val))

                   if node.left == nil, node.right == nil {
                       ans.append(String(newPath.joined(separator: "->")))
                       return
                   }

                   backtrack(node.left, newPath)
                   backtrack(node.right, newPath)
               }

               backtrack(root, [])

               return ans
   }
}

let left = TreeNode(2)
let right = TreeNode(3)
left.right = TreeNode(5)
let result = Solution().binaryTreePaths(TreeNode(1, left, right))
print(result)

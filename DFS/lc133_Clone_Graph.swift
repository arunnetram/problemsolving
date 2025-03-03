//
//  lc133_Clone_Graph.swift
//  
//
//  Created by Arun Sharma on 03/03/25.
//

import Foundation

// Definition for a Node.
public class Node: Hashable {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
    static public func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
}


 

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var oldToNew = [Node: Node]()
        
        func dfs(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            
            // we're using hashmap to keep track of cloned nodes
            // if already cloned, return it
            if let existingClone = oldToNew[node] {
                return existingClone
            }
            
            // copy node to a new node
            let newClone = Node(node.val)
            // update the hashmap
            oldToNew[node] = newClone
            // recurssively go over all neighbors of the node until all are copied in the the clone
            for neighbor in node.neighbors {
                if let clonedNeighbor = dfs(neighbor) {
                    newClone.neighbors.append(clonedNeighbor)
                }
            }
            return newClone
        }
        return dfs(node)
    }
    
}

let sol = Solution()

let node1 = Node(1)
let node2 = Node(2)
let node3 = Node(3)
let node4 = Node(4)

node1.neighbors = [node2, node4]
node2.neighbors = [node1, node3]
node3.neighbors = [node4, node2]
node4.neighbors = [node1, node3]

if let result = sol.cloneGraph(node1) {
    for neighbor in result.neighbors {
        if let node = neighbor {
            print(node.val)
        }
    }
}






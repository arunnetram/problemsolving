//
//  lc210_Course_Schedule_II.swift
//
//
//  Created by Arun Sharma on 03/03/25.
//

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var result = [Int]()
        var visited: Set<Int> = []
        var cycle: Set<Int> = []
        var preMap: [Int: [Int]] = [:]
        
        
        
        // First, create a prerequisiteMap
        for prerequisite in prerequisites {
            let prerequisite = prerequisite[1]
            let course = prerequisite[0]
            
            // preMap[prerequisite] = (preMap[prerequisite] ?? []) + [course]
            preMap[prerequisite, default: []].append(course)
            
        }
        
        ///
        ///We are looking for 3 possible states
        ///visited: added to output
        ///visiting: added to cycle, not output
        ///unvisited: not added to output or cycle
        func dfs(_ node: Int) -> Bool {
            // we've encountered a cycle in the graph. No possible course order exists
            if cycle.contains(node) {
                return false
            }
            
            // avoid revisiting node again
            if visited.contains(node) {
                return true
            }
            
            // visiting
            cycle.insert(node)
            
            for neighbor in preMap[node] ?? [] {
                if !dfs(neighbor) {
                    return false
                }
            }
            
            cycle.remove(node)
            visited.insert(node)
            result.append(node)
            return true
        }
        
        for i in 0..<numCourses {
            if !dfs(i) {
                return []
            }
        }
        return result.reversed()
    }
    
}

let sol = Solution()
//print(sol.findOrder(6, [[1,0],[2,0], [3,1], [2, 3], [0, 5], [0, 4]]))
let prerequisites: [[Int]] = [[45, 18], [18, 50], [45, 4], [50, 49], [49, 88], [88, 18]]
print(sol.findOrder(4, prerequisites))
//print(sol.findOrder(2, [[1, 0]]))
//print(sol.findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]]))

//
//  lc70_Climbing_Stairs.swift
//  
//
//  Created by Arun Sharma on 05/03/25.
//
// Solution from: https://www.youtube.com/watch?v=Y0lT9Fck7qI

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var one = 1
        var two = 1
        
        for _ in 0..<n-1 {
            var temp = one
            one = one + two
            two = temp
            print("One: \(one)")
            print("Two: \(two)")
        }
        
        
        return one
    }
}

let sol = Solution()
print(sol.climbStairs(10))

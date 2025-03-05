//
//  lc198_House_Robber.swift
//  
//
//  Created by Arun Sharma on 05/03/25.
//

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var rob1 = 0
        var rob2 = 0
        
        for n in nums {
            var temp = max(n + rob1, rob2)
            rob1 = rob2
            rob2 = temp
        }
        return rob2
    }
}

let sol = Solution()
let nums = [6, 8, 3, 7, 2, 4, 6, 5, 1]
print(sol.rob(nums))

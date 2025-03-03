//
//  lc136_Single_Number.swift
//
//
//  Created by Arun Sharma on 03/03/25.
// https://youtube.com/shorts/X6vgc_Iubf0?si=MuRqaYtD2ozdh4Ns

import Foundation
class Solution {
    func findNonDuplicate(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            print("\(num) XOR \(res) ")
            res ^= num
            print("= \(res)")
        }
        return res
    }
}

let sol = Solution()

print(sol.findNonDuplicate([3, 4, 5, 4, 3]))

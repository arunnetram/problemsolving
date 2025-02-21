//
//  lc643_Maximum_Average_Subarray_I.swift
//  
//
//  Created by Arun Sharma on 21/02/25.
//

import Cocoa

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
// Best solution
    let count = nums.count
    guard count > k else {
        let sum: Double = Double(nums.reduce(0, +))
        return sum / Double(k)
    }
    var sum = nums[0..<k].reduce(0, +)
    var maxValue = sum
    for index in k..<count {
        sum += nums[index] - nums[index - k]
        maxValue = max(maxValue, sum)
    }
    return (Double(maxValue) / Double(k))
        
        //        Solution 1
//        var maxAverage: Double = 0
//        var sum: Int = 0
//
//        for i in 0..<k {
//            sum += nums[i]
//        }
//        maxAverage = Double(sum) / Double(k)
//
//        for i in k..<nums.count {
//            sum += nums[i] - nums[i - k]
//            maxAverage = max(maxAverage, Double(sum) / Double(k))
//        }
        
        // Solution 2
//        for i in 0..<(nums.count - k + 1) {
//            var windowSum: Int = 0
//            for j in i..<(i + k) {
//                windowSum += nums[j]
//            }
//            maxAverage = max(maxAverage, Double(windowSum) / Double(k))
//        }
        // Solution 3
//        for i in 0..<nums.count {
//            if i < k {
//                sum += nums[i]
//            } else {
//                sum += nums[i] - nums[i - k]
//            }
//            maxAverage = max(maxAverage, Double(sum) / Double(k))
//        }
//        return maxAverage
        
        // uses least memory
//        var sum = 0.0
//        for i in 0..<k {
//            sum += Double(nums[i])
//        }
//        var ans = sum
//        for i in k..<nums.count {
//            sum += Double(nums[i] - nums[i-k])
//            ans = max(ans, sum)
//        }
//        return ans / Double(k)
    }
}

let result = Solution().findMaxAverage([5, 8, 0, 2, 4, 1, 8, 5], 4)
print(result)
let result2 = Solution().findMaxAverage([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 3)
print(result2)
let result3 = Solution().findMaxAverage([-1], 1)
print(result3)




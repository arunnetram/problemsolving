class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var resultArrayofArrays: [[Int]] = []
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] { continue }
            var j = i+1
            var k = nums.count-1
            
            while j < k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum > 0 {
                    k -= 1
                } else if sum < 0 {
                    j += 1
                } else {
                    resultArrayofArrays.append([nums[i], nums[j], nums[k]])
                    j += 1
                    
                    while nums[j] == nums[j-1] && j < k {
                        j += 1
                    }
                }
            }
        }
        
        return resultArrayofArrays
    }
}

let result = Solution().threeSum([-1, 0, 1, 2, -1, -4])
print(result)
let result2 = Solution().threeSum([5, -4, -2, 8, -3, -1])
print(result2)

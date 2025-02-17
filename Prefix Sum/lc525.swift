// rumtime 0ms

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var maxLength = 0
        var count = 0
        var countMap: [Int: Int] = [0: -1] // Start with a base case: count 0 at index -1

        for (index, num) in nums.enumerated() {
            // Update count: increment for 1, decrement for 0
            count += (num == 1 ? 1 : -1)

            // Check if the count has been seen before
            if let prevIndex = countMap[count] {
                maxLength = max(maxLength, index - prevIndex)
            } else {
                // Store the first occurrence of this count
                countMap[count] = index
            }
        }

        return maxLength
    }


  /*
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var count: Int = 0
        var answer: Int = 0
        var countIndexTracker: [Int: Int] = [0:-1]

        for i in 0..<nums.count {
            if nums[i] == 0 {
                count -= 1
            } else {
                count += 1
            }

            if let prevIndex = countIndexTracker[count] {
                answer = max(answer, (i - prevIndex))
            } else {
                countIndexTracker[count] = i
            }
        }
        return answer
    }
}
  */

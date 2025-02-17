class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start: Int = 0
        var end: Int = numbers.count - 1

        while end > start {
            let sum = numbers[start] + numbers[end]
            if sum == target {
                return [start+1, end+1]
            } else if sum > target {
                end -= 1
            } else {
                start += 1
            }
        }
        return []
    }
}

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var subarrayCount: Int = 0
        var frequencyMap: [Int: Int] = [Int: Int]()
        var prefixSum: Int = 0
        frequencyMap[prefixSum] = 1

        for num in nums {
            prefixSum += num

            let result = prefixSum - k
            if let occurance = frequencyMap[result] {
                subarrayCount += occurance
            }
/*
            if let count = frequencyMap[prefixSum] {
                frequencyMap[prefixSum] = count + 1
            } else {
                frequencyMap[prefixSum] = 1
            }
*/
            frequencyMap[prefixSum, default: 0] += 1
        }
        return subarrayCount
    }
}

// Range Sum Query - Immutable

class NumArray {
    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var sum: Int = 0
        if left <= right && left >= 0 && right < nums.count {
            for index in left...right {
                sum += nums[index]
            }
        }
        return sum
    }
}

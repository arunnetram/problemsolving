// Range Sum Query - Immutable


// basic solution
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

// updated solution using Prefix Sums
class Num {
    var arr: [Int]
    var prefixSums: [Int] = []

    init(_ arr: [Int]) {
        self.arr = arr 
        var total = 0

        for n in arr {
            total += n
            prefixSums.append(total)
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var rightRange = prefixSums[right]
        var leftRange = left - 1 < 0 ? 0 : prefixSums[left - 1]
        return rightRange - leftRange
    }
}

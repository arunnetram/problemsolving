import Foundation

class ProblemArray {
  static func alternatingMaxLength(arr: [Int]) -> Int {
    var increasing: Int = 1
    var decreasing: Int = 1

    for index in 1..<arr.count {
      if arr[index] > arr[index - 1] {
        increasing = decreasing + 1
      } else if(arr[index] < arr[index - 1]) {
        decreasing = increasing + 1
      }
    }

    return max(increasing, decreasing)
  }
}

print(ProblemArray.alternatingMaxLength(arr: [1,17, 5, 10, 13, 15, 10, 17, 8]))

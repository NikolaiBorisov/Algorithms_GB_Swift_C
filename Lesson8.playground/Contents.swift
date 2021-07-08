import UIKit

// 1. Реализовать сортировку подсчетом.

var array = [Int]()

for _ in 1...100 {
  array.append(Int.random(in: 0..<100))
}

func countingSort(inputArray: [Int], maxNumber: Int) {
  var array = inputArray
  var count = 0
  
  var countArray = Array(repeating: 0, count: maxNumber + 1)
  
  for i in 0..<array.count {
    countArray[array[i]] += 1
    count += 1
  }
  
  var index = 0
  for i in 0..<countArray.count {
    if countArray[i] != 0 {
      for _ in 0..<countArray[i] {
        array[index] = i
        index += 1
        count += 1
      }
    }
  }
}
countingSort(inputArray: array, maxNumber: 99)

// 2. Реализовать быструю сортировку

var count = 0

func swiftSort(array: [Int]) -> [Int] {
  count += 1
  guard array.count > 1 else { return array }
  
  var less = [Int]()
  var greater = [Int]()
  var equal = [Int]()
  
  let pivot = array[array.count / 2]
  
  for i in 0..<array.count {
    count += 1
    if array[i] == pivot { equal.append(array[i]); continue }
    array[i] < pivot ? less.append(array[i]) : greater.append(array[i])
    count += 1
  }
  return swiftSort(array: less) + equal + swiftSort(array: greater)
}
swiftSort(array: array)

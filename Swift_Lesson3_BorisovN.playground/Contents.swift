import UIKit

// 1. Попробовать оптимизировать пузырьковую сортировку. Сравнить количество операций сравнения оптимизированной и не оптимизированной программы. Написать функции сортировки, которые возвращают количество операций.

var randomArray: [Int] = []

for _ in 0..<10 {
  let randomInt = Int(arc4random_uniform(UInt32(100)))
  randomArray.append(randomInt)
}

// Solution (1st method O(nˆ2) - simple comparison and swapping):

func bubbleSort1(inputArray: [Int]) -> [Int] {
  var result = inputArray
  let numberOfElements = result.count
  var operationCounter = 0
  for _ in 0..<(numberOfElements - 1) {
    for j in 0..<(numberOfElements - 1) {
      operationCounter += 1
      if result[j] > result[j + 1] {
        let temp = result[j]
        result[j] = result[j + 1]
        result[j + 1] = temp
      }
    }
  }
  print("1st Task.\n----------\nSolution 1:\nArray after bubble sorting: \(result)")
  print("There are \(operationCounter) operations in total\n")
  return result
}
bubbleSort1(inputArray: randomArray)

// Solution (2nd method O(n) - changing upper limit for inner for loop):

func bubbleSort2(inputArray: [Int]) -> [Int] {
  var result = inputArray
  let numberOfElements = result.count
  var operationCounter = 0
  var isSwapped: Bool
  for i in 0..<(numberOfElements - 1) {
    isSwapped = false
    for j in 0..<(numberOfElements - i - 1) {
      operationCounter += 1
      if result[j] > result[j + 1] {
        result.swapAt(j, j + 1)
        isSwapped = true
      }
    }
    if !isSwapped {
      break
    }
  }
  print("Solution 2:\nArray after bubble sorting: \(result)")
  print("There are \(operationCounter) operations in total\n")
  return result
}
bubbleSort2(inputArray: randomArray)

// Solution (3rd method O(n⌃2) - changing upper limit for inner for loop):

func bubbleSort3(inputArray: [Int]) -> [Int] {
  var result = inputArray
  let numberOfElements = inputArray.count
  var operationCounter = 0
  for i in 0..<(numberOfElements - 1) {
    for j in 0..<(numberOfElements - i - 1) {
      operationCounter += 1
      if result[j] > result[j + 1] {
        result.swapAt(j, j + 1)
      }
    }
  }
  print("Solution 3:\nArray after bubble sorting: \(result)")
  print("There are \(operationCounter) operations in total\n")
  return result
}
bubbleSort3(inputArray: randomArray)

// Solution (4th method O(n) - generic function using while loop):

func bubbleSort4<T: Comparable>(inputArray: [T]) -> [T] {
  var result = inputArray
  var operationCounter = 0
  let numberOfElements = result.count
  var lastUnsorted = numberOfElements - 1
  var isSorted = false
  while !isSorted {
    isSorted = true
    for i in 0..<lastUnsorted {
      operationCounter += 1
      if result[i] > result[i + 1] {
        result.swapAt(i, i + 1)
        isSorted = false
      }
    }
    lastUnsorted -= 1
  }
  print("Solution 4:\nArray after bubble sorting: \(result)")
  print("There are \(operationCounter) operations in total\n")
  return result
}
bubbleSort4(inputArray: randomArray)

// Solution (5th method O(n) - using extension):

extension Array where Element: Comparable {
  
  func bubbleSort5() -> [Element] {
    var result = self
    let numberOfElements = result.count
    var lastUnsorted = numberOfElements - 1
    var isSorted = false
    var operationCounter = 0
    while (!isSorted) {
      isSorted = true
      for i in 0..<lastUnsorted {
        operationCounter += 1
        if result[i] > result[i + 1] {
          result.swapAt(i, i + 1)
          isSorted = false
        }
      }
      lastUnsorted -= 1
    }
    print("Solution 5:\nArray after bubble sorting: \(result)")
    print("There are \(operationCounter) operations in total\n")
    return result
  }
}
//randomArray.bubbleSort5()

// 2. *Реализовать шейкерную сортировку.

func cocktailSort(inputArray: [Int]) -> [Int] {
  var result = inputArray
  var isSorted = false
  var operationCounter = 0
  var lastUnsorted = result.count - 1
  while !isSorted {
    isSorted = true
    for i in 1..<result.count {
      operationCounter += 1
      if result[i - 1] > result[i] {
        result.swapAt(i - 1, i)
        isSorted = false
      }
    }
    if isSorted {
      break
    }
    for j in 1..<lastUnsorted {
      lastUnsorted -= 1
      if result[j - 1] > result[j] {
        result.swapAt(j - 1, j)
        isSorted = false
      }
    }
  }
  print("2nd Task.\n----------\nArray after cocktail sorting: \(result)")
  print("There are \(operationCounter) operations in total\n")
  return result
}
cocktailSort(inputArray: randomArray)

// 3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.

var randomArray2: [Int] = []

for _ in 0..<100 {
  let randomInt = Int(arc4random_uniform(UInt32(100)))
  randomArray2.append(randomInt)
}
let sortedArray = randomArray2.sorted()
print("3rd Task.\n----------\nSorted Array:\(sortedArray)\n")

// Solution (1st method - using while):

func binarySearch1(enteredNumber: Int, enteredSortedArray: [Int]) -> Int? {
  var minIndex = 0
  var operationCounter = 0
  var maxIndex = enteredSortedArray.count - 1
  while minIndex <= maxIndex {
    operationCounter += 1
    let midIndex = minIndex + ( maxIndex - minIndex) / 2
    if enteredNumber < enteredSortedArray[midIndex] {
      maxIndex = midIndex - 1
    } else  if enteredNumber > enteredSortedArray[midIndex] {
      minIndex = midIndex + 1
    } else {
      print("Solution 1:\nEntered number = \(enteredNumber). The index of entered number = \(midIndex)")
      print("There are \(operationCounter) operations in total\n")
      return midIndex
    }
  }
  print("Solution 1:\nEntered number = \(enteredNumber). Sorry, there is no such number...\(-1)\n")
  return -1
}
binarySearch1(enteredNumber: 11, enteredSortedArray: sortedArray)

// Solution (2nd method - using if statement):

func binarySearch2(enteredNumber: Int, enteredSortedArray: [Int]) -> Int? {
  if enteredSortedArray.count == 0 { return -1 }
  let minIndex = 0
  let maxIndex = enteredSortedArray.count - 1
  let midIndex = maxIndex / 2
  let midValue = enteredSortedArray[midIndex]
  
  if enteredNumber < enteredSortedArray[minIndex] || enteredNumber > enteredSortedArray[maxIndex] {
    print("Solution 2:\nEntered number\(enteredNumber) is not in the array\n")
    return -1
  }
  if enteredNumber > midValue {
    let slice = Array(enteredSortedArray[midIndex + 1...maxIndex])
    return binarySearch2(enteredNumber: enteredNumber, enteredSortedArray: slice)
  }
  if enteredNumber < midValue {
    let slice = Array(enteredSortedArray[minIndex...midIndex - 1])
    return binarySearch2(enteredNumber: enteredNumber, enteredSortedArray: slice)
  }
  if enteredNumber == midValue {
    print("Solution 2:\nEntered number \(enteredNumber) is in the array\n")
  }
  return -1
}
binarySearch2(enteredNumber: 23, enteredSortedArray: sortedArray)

// 4. *Подсчитать количество операций для каждой из сортировок и сравнить его с асимптотической сложностью алгоритма.

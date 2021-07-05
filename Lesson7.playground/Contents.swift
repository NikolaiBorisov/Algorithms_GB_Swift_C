import UIKit

// 1. Написать функции, которые считывают матрицу смежности из файла и выводят ее на экран.

@discardableResult func readFromFile() -> [Int]? {
  var tempArr1 = [String]()
  var tempArr2 = [String]()
  var resultArr = [Int]()
  
  if let pathT = Bundle.main.path(forResource: "text", ofType: "txt") {
    if let textT = try? String(contentsOfFile: pathT) {
      tempArr1 = textT.components(separatedBy: "\n")
      tempArr1.forEach {
        tempArr2 += $0.components(separatedBy: " ")
      }
      tempArr2.removeAll(where: {$0 == ""})
      tempArr2.forEach { resultArr.append(Int($0) ?? 0) }
    }
  }
  if resultArr.count == 0 {
    print("Error")
    return nil
  }
  if resultArr[0] * resultArr[0] == resultArr.count - 1 {
    print("Matrix size \(resultArr[0]) * \(resultArr[0]) with \(resultArr.count - 1) elements")
  } else {
    print("Error")
    return nil
  }
  
  var letters = [Character]()
  var a = 65
  for _ in 0..<resultArr[0] {
    letters.append(Character(UnicodeScalar(a) ?? "A"))
    a += 1
  }
  print(" ", terminator: " ")
  for i in 0..<letters.count {
    print(letters[i], terminator: " ")
  }
  var b = 0
  for i in 1..<resultArr.count {
    if i % resultArr[0] == 1 {
      print(letters[b], terminator: " ")
      b += 1
    }
    print(resultArr[i], terminator: " ")
    if i % resultArr[0] == 0 {
      print()
    }
  }
  return resultArr
}
let array = readFromFile()

// 2. Написать рекурсивную функцию обхода графа в глубину.

print("Array \(String(describing: array?[0]))\n")

var letters = [Character]()
if let size = array?[0] {
  var a = 65
  for _ in 0..<size {
    letters.append(Character(UnicodeScalar(a) ?? "A"))
    a += 1
  }
}
var arrayOfDots = Array(repeating: false, count: letters.count)
var sumOfEdges = 0

func graphDepth(array: [Int], vertex: Int, sum: Int) {
  if array.count == 0 { return }
  if arrayOfDots[vertex] == true {
    return
  } else if arrayOfDots[vertex] == false {
    print(letters[vertex])
    arrayOfDots[vertex] = true
    sumOfEdges += sum
  }
  for i in 1...5 {
    if array[i + (vertex * 5)] != 0 {
      let newVertex = i - 1
      let edges = array[i + (vertex * 5)]
      graphDepth(array: array, vertex: newVertex, sum: edges)
    }
  }
}
if let newArray = array {
  graphDepth(array: newArray, vertex: 0, sum: 0)
}
for i in 0..<arrayOfDots.count {
  arrayOfDots[i] == true ? nil : print(letters[i])
}
print("Length of edges - \(sumOfEdges)")

// 3. Написать функцию обхода графа в ширину

var arrayOfControlDots = Array(repeating: 0, count: letters.count)
var process = 0

arrayOfControlDots[0] = 1
sumOfEdges = 0

func grapthVertex(array: [Int], vertex: Int) {
  if array.count == 0 { return }
  if arrayOfControlDots[vertex] == 2 {
    return
  } else if arrayOfControlDots[vertex] == 1 {
    arrayOfControlDots[vertex] = 2
  }
  for i in 1...5 {
    if array[i + (vertex * 5)] != 0 {
      if arrayOfControlDots[i - 1] == 0 {
        arrayOfControlDots[i - 1] = 1
        sumOfEdges += array[i + (vertex * 5)]
      }
    }
  }
}

func graphTraversal() {
  var secure = 0
  repeat {
    var nextVertex = [Int]()
    if let newArr = array {
      for i in 0..<arrayOfControlDots.count {
        if arrayOfControlDots[i] == 1 {
          nextVertex.append(i)
        }
      }
        if nextVertex.count > 0 {
          for i in  0..<nextVertex.count {
            grapthVertex(array: newArr, vertex: nextVertex[i])
          }
        }
      }
      secure += 1
      if secure == 30 { break }
    } while process != arrayOfControlDots.count * 2
  }
print("Graph vertices \(String(describing: array?[0]))\n")
graphTraversal()

for i in 0..<arrayOfControlDots.count {
  arrayOfControlDots[i] == 2 ? nil : print("\(letters[i])")
}
print("All edges length - \(sumOfEdges)")

import UIKit

// 1. Реализовать простейшую хеш-функцию. На вход функции подается строка, на выходе сумма кодов символов.

func hashFunction(string: String) -> String {
  var a = 0
  for scalar in string.unicodeScalars {
    a += Int(scalar.value)
  }
  print("Initial string - \(string)")
  print("Decimal sum - \(a)")
  print("Hexadecimal sum - \(String(format: "$2X", a))")
  
  let array = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  var resultString = ""
  array.forEach {
    let symbol = String(format: "%2X", $0 * a % 255)
    for char in symbol {
      if char == " " {
        resultString.append("0")
      } else {
        resultString.append(char)
      }
    }
  }
  return resultString
}
print(hashFunction(string: "a"))
print(hashFunction(string: "b"))

// 2. Переписать программу, реализующую двоичное дерево поиска. а) Добавить в него обход дерева различными способами; б) Реализовать поиск в двоичном дереве поиска;

final class Node {
  
  let value: Int
  var leftInheritor: Node?
  var rightInheritor: Node?
  var parent: Node?
  
  init(value: Int, leftInheritor: Node? = nil, rightInheritor: Node? = nil, parent: Node? = nil) {
    self.value = value
    self.leftInheritor = leftInheritor
    self.rightInheritor = rightInheritor
    self.parent = parent
  }
}

final class Tree {
  var root: Node?
  
  init(root: Node? = nil) {
    self.root = root
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    var description = "Node \(Unmanaged.passUnretained(self).toOpaque()) has a value \(value)"
    if let leftInheritor = leftInheritor {
      description = description + ", leftInheritor value \(leftInheritor.value)"
    }
    if let rightInheritor = rightInheritor {
      description = description + ", rightInheritor value \(rightInheritor.value)"
    }
    return description
  }
}
var initialArray = [Int]()
for _ in 1...100 {
  initialArray.append(Int.random(in: 1..<100))
}
print("There are \(initialArray.count) items in the array")
print(initialArray)

var tree = Tree()
var treeArray = [Node]()
var bool = true
var startCount = 0

func createTree(array: [Int], parent: Node?) -> Node? {
  startCount += 1
  if array.count > 3 {
    let sorted = array.sorted { $0 < $1 }
    var center = sorted.count / 2
    
    for i in (sorted.count / 2)...(sorted.count - 1) {
      if i < sorted.count - 1 {
        if sorted[i] != sorted[i + 1] {
          break
        }
        if sorted[i] == sorted[i + 1] {
          center = i + 1
        }
      }
    }
    var nl = [Int]()
    for i in 0...(center - 1) { nl.append(sorted[i]) }
    var nr = [Int]()
    if (sorted.count - 1 - center) > 0 {
      for i in (center + 1)...(sorted.count - 1) { nr.append(sorted[i]) }
    }
    var root = Node(value: sorted[center], leftInheritor: nil, rightInheritor: nil, parent: parent)
    
    if sorted.count / 2 == center {
      bool == true ? print("Balanced tree") : nil
      bool = false
    } else {
      bool == true ? print("Unbalanced tree") : nil
      bool = false
    }
    let leftInheritor = createTree(array: nl, parent: root)
    let rightInheritor = createTree(array: nr, parent: root)
    root = Node(value: sorted[center], leftInheritor: leftInheritor, rightInheritor: rightInheritor, parent: parent)
    
    tree.root = root
    treeArray.append(root)
    return root
  } else if array.count == 1 {
    let root = Node(value: array[0], leftInheritor: nil, rightInheritor: nil, parent: parent)
    treeArray.append(root)
    return root
  } else if array.count == 2 {
    let sorted = array.sorted { $0 < $1 }
    var root = Node(value: sorted[1], leftInheritor: nil, rightInheritor: nil, parent: parent)
    let leftInheritor = Node(value: sorted[1], leftInheritor: nil, rightInheritor: nil, parent: root)
    root = Node(value: sorted[1], leftInheritor: leftInheritor, rightInheritor: nil, parent: parent)
    treeArray.append(root)
    treeArray.append(leftInheritor)
    return root
  } else if array.count == 3 {
    let sorted = array.sorted { $0 < $1 }
    let root = Node(value: sorted[1], leftInheritor: nil, rightInheritor: nil, parent: parent)
    let leftInheritor = Node(value: sorted[0], leftInheritor: nil, rightInheritor: nil, parent: root)
    let rightInheritor = Node(value: sorted[2], leftInheritor: nil, rightInheritor: nil, parent: parent)
    treeArray.append(root)
    treeArray.append(leftInheritor)
    treeArray.append(rightInheritor)
    return root
  }
  return nil
}
createTree(array: initialArray, parent: nil)
print("Root has value - \(String(describing: tree.root?.value))")
treeArray.forEach {
  if $0.parent == nil { print($0.value) }
}

var secondTreeList = [Node]()
var firstTreeList = [Node]()
var treeNode = [Node]()

treeArray.forEach { if $0.leftInheritor == nil { if $0.rightInheritor == nil { secondTreeList.append($0) } } }
treeArray.forEach { if $0.leftInheritor == nil { if $0.rightInheritor == nil { firstTreeList.append($0) } } }
treeArray.forEach { if $0.leftInheritor == nil { if $0.rightInheritor == nil { firstTreeList.append($0) } } }
treeArray.forEach { if $0.leftInheritor == nil { if $0.rightInheritor == nil { treeNode.append($0) } } }

print("Number of sheets - \(secondTreeList.count)")
print("Number of nodes with one sheet - \(firstTreeList.count)")
print("Number of parents - \(treeNode.count)")

if secondTreeList.count + firstTreeList.count + treeNode.count == initialArray.count {
  print("Ok")
} else {
  print("Error")
}

func printTree(root: Node?) {
  if let node = root {
    print("\(node.value)", terminator: "")
    if node.leftInheritor != nil || node.rightInheritor != nil {
      print("(", terminator: "")
      if node.leftInheritor != nil {
        printTree(root: node.leftInheritor)
      } else {
        print("nil", terminator: "")
      }
      print(",", terminator: "")
      
      if node.rightInheritor != nil {
        printTree(root: node.rightInheritor)
      } else {
        print("nil", terminator: "")
      }
      print(")", terminator: "")
    }
  }
}
printTree(root: tree.root)

func rootLefRight(root: Node?) {
  if let node = root {
    print("\(node.value)", terminator: " ")
    rootLefRight(root: node.leftInheritor)
    rootLefRight(root: node.rightInheritor)
  }
}

func leftRootRight(root: Node?) {
  if let node = root {
    rootLefRight(root: node.leftInheritor)
    print("\(node.value)", terminator: " ")
    rootLefRight(root: node.rightInheritor)
  }
}

func leftRightRoot(root: Node?) {
  if let node = root {
    rootLefRight(root: node.leftInheritor)
    rootLefRight(root: node.rightInheritor)
    print("\(node.value)", terminator: " ")
  }
}
print("Root -> Left -> Right :")
rootLefRight(root: tree.root)
print("Left -> Root -> Right :")
leftRootRight(root: tree.root)
print("Post-order  Left -> Right -> Root :")
leftRightRoot(root: tree.root)
print()
print("Search for a value in a tree :")

let searchValue = Int.random(in: 10..<60)
print("Values for search \(searchValue), from 10 to 60")

func searchInTree(root: Node?, value: Int) {
  if let node = root {
    if value == node.value {
      print("\(node) - have value \(value)")
      if let leftNode = node.leftInheritor?.value {
        if value == leftNode {
          searchInTree(root: node.leftInheritor, value: value)
        }
      }
    } else if value > node.value {
      searchInTree(root: node.rightInheritor, value: value)
    } else if value < node.value {
      searchInTree(root: node.leftInheritor, value: value)
    }
  }
}

searchInTree(root: tree.root, value: searchValue)

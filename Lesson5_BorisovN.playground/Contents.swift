import UIKit

// 1. Реализовать перевод из десятичной в двоичную систему счисления с использованием стека.

final class Node {
  
  let value: Int
  var nextNode: Node?
  
  init(value: Int, nextNode: Node? = nil) {
    self.value = value
    self.nextNode = nextNode
  }
}

final class SinglyLinkedList {
  
  var firstNode: Node?
  
  init(firstNode: Node? = nil) {
    self.firstNode = firstNode
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    let firstPart = "Node \(Unmanaged.passUnretained(self).toOpaque()) has value \(value) and"
    if let nextNode = nextNode {
      return firstPart + " next node value \(nextNode.value)"
    } else {
      return firstPart + " no next node"
    }
  }
}

extension SinglyLinkedList: CustomStringConvertible {
  var description: String {
    var description = "List \(Unmanaged.passUnretained(self).toOpaque())"
    if firstNode != nil {
      description += " has nodes:\n"
      
      var node = firstNode
      while node != nil {
        description += (node!.description + "\n")
        node = node!.nextNode
      }
      return description
    } else {
      return description + " has no nodes"
    }
  }
}

var list = SinglyLinkedList()

func pushNode(value: Int ) throws {
  
  guard let currentNode = list.firstNode else {
    let firstNode = Node(value: value)
    list.firstNode = firstNode
    return
  }
  let newNode = Node(value: value, nextNode: currentNode)
  list.firstNode = newNode
}

func printNodes() {
  guard var entity = list.firstNode else {
    print("Stack is empty")
    return
  }
  repeat {
    print("\(entity.value)", terminator: "")
    guard let newEntity = entity.nextNode else {
      print("\n")
      return
    }
    entity = newEntity
  } while true
}

func fromDecimalToBinary(value: Int) {
  var int = value
  if int > -1 {
    while int != 0 {
      if int % 2 == 1 {
        do {
          try pushNode(value: 1)
        } catch {
          print(error)
        }
      } else {
        do {
          try pushNode(value: 0)
        } catch {
          print(error)
        }
      }
      int = int / 2
    }
    printNodes()
  } else {
    print("Wrong Int")
  }
}
print("1st Task.")
fromDecimalToBinary(value: 120)

// 2. Добавить в программу «реализация стека на основе односвязного списка» проверку на выделение памяти. Если память не выделяется, то выводится соответствующее сообщение. Постарайтесь создать ситуацию, когда память не будет выделяться (добавлением большого количества данных).

print("2nd Task.")
print(list)

// 3. Написать программу, которая определяет, является ли введенная скобочная последовательность правильной. Примеры правильных скобочных выражений: (), ([])(), {}(), ([{}]), неправильных — )(, ())({), (, ])}), ([(]) для скобок [,(,{. Например: (2+(2*2)) или [2/{5*(4+7)}]

print("3rd Task.")
let enteredString = "{1*[2+3]/4}*(5+6)"
var bracketsArray = [Character]()
let closingBracket: [Character] = [")","]","}"]
let allBrackets: [Character] = ["(","[","{",")","]","}"]

for character in enteredString {
  if allBrackets.contains(character) {
    bracketsArray.append(character)
  }
}

var i = 0

let a: Character = "("
let d: Character = "["
let c: Character = "{"
let f: Character = "}"
let b: Character = "]"
let j: Character = ")"


repeat {
  if closingBracket.contains(bracketsArray[i]) {
    print("Wrong brackets!")
    break
  }
  if bracketsArray[i] == a {
    if bracketsArray[i+1] == j {
      bracketsArray.remove(at: i)
      bracketsArray.remove(at: i)
      i = 0
      continue
    }
  }
  if bracketsArray[i] == d {
    if bracketsArray[i+1] == b {
      bracketsArray.remove(at: i)
      bracketsArray.remove(at: i)
      i = 0
      continue
    }
  }
  if bracketsArray[i] == c {
    if bracketsArray[i+1] == f {
      bracketsArray.remove(at: i)
      bracketsArray.remove(at: i)
      i = 0
      continue
    }
  }
  
  i += 1
  
} while i < bracketsArray.count - 1

if bracketsArray.count > 0 {
  print("Wrong brackets!")
} else if bracketsArray.count == 0 {
  print("Correct parenthesis")
} else {
  print("Error")
}

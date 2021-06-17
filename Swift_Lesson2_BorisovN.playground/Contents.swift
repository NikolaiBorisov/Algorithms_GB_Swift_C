import UIKit

// 1. Реализовать функцию перевода из десятичной системы в двоичную, используя рекурсию;
// 1.1. Вы можете ввести любую систему счисления используя входной параметр enteredNumeralSystem

func numeralSystemConverter(enteredDecimalNumber: Int, enteredNumeralSystem: Int) -> String {
  let numbers =  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
  if enteredDecimalNumber < enteredNumeralSystem {
    return numbers[enteredDecimalNumber]
  } else {
    return numeralSystemConverter(
      enteredDecimalNumber: enteredDecimalNumber / enteredNumeralSystem,
      enteredNumeralSystem: enteredNumeralSystem
    )
    + numbers[enteredDecimalNumber % enteredNumeralSystem]
  }
}
print("1st task.\n----------\nSolution 1:\nEntered number in binary system = \(numeralSystemConverter(enteredDecimalNumber: 5, enteredNumeralSystem: 2))\n")

// 1.2

func convertToBinary(decimalNumber: Int) -> Int {
  if decimalNumber == 0 { return 0 }
  else {
    return decimalNumber % 2 + 10 * convertToBinary(decimalNumber: decimalNumber / 2)
  }
}
print("1st task.\n----------\nSolution 2:\nEntered number in binary system = \(convertToBinary(decimalNumber: 5))\n")

// 2. Реализовать функцию возведения числа a в степень b: a. без рекурсии; b. рекурсивно; c. *рекурсивно, используя свойство четности степени.
// 2.1.

func powerA(enteredNumber: Double, power: Double) -> Double {
  guard enteredNumber > 0,
        power > 0
  else { return 0 }
  let result = pow(enteredNumber, power)
  print("2nd task.\n----------\na:\n\(enteredNumber) in power \(power) = \(result)\n")
  return result
}
powerA(enteredNumber: 5, power: 3)

// 2.2.

func recursionPowerB(number: Int, power: Int, p: Int = 1) -> Int {
  if power > 0 {
    return recursionPowerB(number: number, power: power - 1, p: p * number)
  } else {
    return p
  }
}
print("2nd task.\n----------\nb:\nThe result = \(recursionPowerB(number: 5, power: 2))\n")

// 2.3.

func recursionPowerC(number: Int, power: Int, p: Int = 1) -> Int {
  if power > 0 {
    if (power % 2 == 0) {
      return recursionPowerC(number: number * number, power: power / 2, p: p)
    } else {
      return recursionPowerC(number: number, power: power - 1, p: p * number)
    }
  } else {
    return p
  }
}
print("2nd task.\n----------\nc:\nThe result = \(recursionPowerC(number: 5, power: 4))")

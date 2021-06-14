import UIKit

// 1. Ввести вес и рост человека. Рассчитать и вывести индекс массы тела по формуле I=m/(h*h); где m-масса тела в килограммах, h - рост в метрах.
// 1.1 1st solution using "if, else statement":

func calculateBMIUsingIfElse(enterYourWeightInKg m: Double, enterMeasureUnitForHeight mORcm: String, enterYourHeightAccordingMeasureUnit h: Double) {
  
  print("1st task.\n----------")
  var bmi = 0.0
  
  if mORcm == "m" {
    bmi = m / ( h * h)
  } else if mORcm == "cm" {
    bmi = m / ((h / 100) * (h / 100))
  } else {
    print("Result: Wrong measure unit. Enter m or cm")
    return
  }
  
  print("Solution 1:\n\nResult: Your BMI = \(String(format: "%.2f", bmi))")
  if bmi > 25.0 {
    print("Category: ❗️Overweight❗️\nConclusion: Buddy, you're fat =( Run, Forest, run...🏃🏻‍♂️")
  } else if bmi >= 18.5 && bmi <= 25.0 {
    print("Category: ✅ Normal ✅\nConclusion: Wow! Look at you! You're in a good shape, buddy👏🏻 Good job!")
  } else {
    print("Category: ⚠️ Mild Thinness ⚠️\nConclusion: You're skinny as Gollum =( Mate, you need to eat more🍗!")
  }
  print("=============================\nBMI categories table (kg/m2)\n=============================\nSevere Thinness < 16.0\nModerate Thinness 16.0 - 17.0\nMild Thinness 17.1 - 18.5\nNormal 18.5 - 25.0\nOverweight 25.1 - 30.0\nObese Class I 30.1 - 35.0\nObese Class II 35.0 - 40.0\nObese Class III  > 40.1\n=============================\n")
}
calculateBMIUsingIfElse(enterYourWeightInKg: 84.0, enterMeasureUnitForHeight: "cm", enterYourHeightAccordingMeasureUnit: 177)

// 1.2 2nd solution using "switch":

func calculateBMIUsingSwitch(enterYourWeightInKg m: Double, enterYourHeightInMeters h: Double) {
  let bmi = m / ( h * h)
  print("Solution 2:\n\nResult: Your BMI = \(String(format: "%.2f", bmi))")
  switch bmi {
  case _ where bmi > 25.0: print("Category: ❗️Overweight❗️\nConclusion: Buddy, you're fat =( Run, Forest, run...🏃🏻‍♂️")
  case _ where bmi >= 18.5 && bmi <= 25.0: print("Category: ✅ Normal ✅\nConclusion: Wow! Look at you! You're in a good shape, buddy👏🏻 Good job!")
  default: print("Category: ⚠️ Mild Thinness ⚠️\nConclusion: You're skinny as Gollum =( Mate, you need to eat more🍗!")
  }
  print("=============================\nBMI categories table (kg/m2)\n=============================\nSevere Thinness < 16.0\nModerate Thinness 16.0 - 17.0\nMild Thinness 17.1 - 18.5\nNormal 18.5 - 25.0\nOverweight 25.1 - 30.0\nObese Class I 30.1 - 35.0\nObese Class II 35.0 - 40.0\nObese Class III  > 40.1\n=============================\n")
}
calculateBMIUsingSwitch(enterYourWeightInKg: 77.0, enterYourHeightInMeters: 1.77)

// 2. Найти максимальное из четырех чисел. Массивы не использовать.
// 2.1 1st solution(использовал примитивный алгоритм, лучше ничего не придумал. Можете показать более интересное решение?):

func findTheMaxNumberUsingIfElse(number1: Int, number2: Int, number3: Int, number4: Int) {
  var max = 0
  if number1 > number2 && number1 > number3 && number1 > number4 {
    max = number1
  } else if number2 > number3 && number2 > number4 {
    max = number2
  } else if number3 > number4 {
    max = number3
  } else {
    max = number4
  }
  print("2nd task.\n----------\nSolution 1:\nResult: max number = \(max)\n")
}
findTheMaxNumberUsingIfElse(number1: 111, number2: 2222, number3: 33333, number4: 4)

// 2.2 2nd solution:

func findTheMaxNumberUsingMax(number1: Int, number2: Int, number3: Int, number4: Int) {
  let maxNumber = max(number1, number2, number3, number4)
  print("Solution 2:\nResult: max number = \(maxNumber)\n")
}
findTheMaxNumberUsingMax(number1: 2, number2: 3, number3: 4, number4: 5)

// 2.3 3rd solution using ternary operator:

func findTheMaxNumberUsingTeranryOperator(number1: Int, number2: Int, number3: Int, number4: Int) {
  var max = 0
  max = (
    number1 > number2 && number1 > number3 && number1 > number4
  ) ? number1 :
  (
    number2 > number3 && number2 > number4
  ) ? number2 :
  (
    number3 > number4
  ) ? number3 : number4
  print("Solution 3:\nResult: max number = \(max)\n")
}
findTheMaxNumberUsingTeranryOperator(number1: 1, number2: 22, number3: 2, number4: 11)

// 3. Написать программу обмена значениями двух целочисленных переменных: a. с использованием третьей переменной; b. *без использования третьей переменной.
// 3.1 1st solution using 3rd variable:

var a = 1
var b = 2
var c = a
a = b
b = c
print("3rd task.\n----------\nSolution 1:\na = \(a)\nb = \(b)\n")

// 3.2 2nd solution using tuple:
var aa = 5, bb = 6
(aa, bb) = (bb, aa)

// 3.3 3rd solution using swap:
var cc = 7, dd = 8
swap(&cc, &dd)
print("Solution 3:\ncc = \(cc)\ndd = \(dd)\n")

// 3.4 4th solution using operators "+", "-":

var d = 3
var e = 4
d = d + e
e = d - e
d = d - e
print("Solution 4:\nd = \(d)\ne = \(e)\n")

// 3.5 5th solution using "inout":

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let tempVar = a
  a = b
  b = tempVar
  print("Solution 5:\nq = \(a)\nz = \(b)\n")
}
var q = 1, z = 2
swapTwoInts(&q, &z)

// 4. Написать программу нахождения корней заданного квадратного уравнения.
// Примеры: 4x2 + 10x + 3 = 0  (2 корня); x2 + 12x + 36 =0 (один корень); 2x2 + x + 5 = 0 (нет корней)

func solveQuadraticEquation(a: Double, b: Double, c: Double) {
  print("4th task.\n----------")
  let discriminant = pow(b, 2) - (4 * (a * c))
  if discriminant > 0 {
    let x1 = ((-b) + sqrt(discriminant)) / (2 * a)
    let x2 = ((-b) - sqrt(discriminant)) / (2 * a)
    print("D > 0. Equation has two roots:\nx1 = \(String(format: "%.1f",x1))\nx2 = \(String(format: "%.1f",x2))\n")
  } else if discriminant == 0 {
    let x1 = (-b) / (2 * a)
    print("D = 0. Equation has one root:\nx1 = \(String(format: "%.1f",x1))\n")
  } else {
    print("D < 0. Equation has no roots\n")
  }
}
solveQuadraticEquation(a: 4, b: 10, c: 3)

// 5. С клавиатуры вводится номер месяца. Требуется определить, к какому времени года он относится.
// 1st solution using "if, else statement:

func defineTheSeason(inputNumber n: Int) {
  print("5th task.\n----------\nSolution 1:")
  if n == 12 || n == 1 || n == 2 {
    print("Result: The season is Winter\n")
  } else if n == 3 || n == 4 || n == 5 {
    print("Result: The season is Spring\n")
  } else if n == 6 || n == 7 || n == 8 {
    print("Result: The season is Summer\n")
  } else if n == 9 || n == 10 || n == 11 {
    print("Result: The season is Fall\n")
  } else {
    print("Result: Wrong number!\n")
  }
}
defineTheSeason(inputNumber: 5)

// 2nd solution using enum and switch:

enum MonthNumber: Int {
  case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve
}

func defineTheSeasonSwitch(inputNumber: MonthNumber.RawValue) {
  print("Solution 2:")
  switch inputNumber {
  case 12, 1, 2: print("Result: The season is Winter\n")
  case 3, 4, 5: print("Result: The season is Spring\n")
  case 6, 7, 8: print("Result: The season is Summer\n")
  case 9, 10, 11: print("Result: The season is Fall\n")
  default: print("Result: Wrong number\n")
  }
}
defineTheSeasonSwitch(inputNumber: 6)

// 6. Ввести возраст человека (от 1 до 150 лет) и вывести его вместе с последующим словом «год», «года» или «лет».

func printtheAge(enterTheAgeFrom1To150 age: String) {
  print("6th task.\n----------")
  if age.hasSuffix("11") || age.hasSuffix("12") || age.hasSuffix("13") || age.hasSuffix("14") || age.hasSuffix("15") || age.hasSuffix("16" ) || age.hasSuffix("17" ) || age.hasSuffix("18") || age.hasSuffix("19") {
    print("Result: \(age) лет\n")
  } else if age.last == "2" || age.last == "3" || age.last == "4" {
    print("Result: \(age) года\n")
  } else if age.last == "5" || age.last == "6" || age.last == "7" || age.last == "8" || age.last == "9" || age.last == "0" {
    print("Result: \(age) лет\n")
  } else if age.last == "1" {
    print("Result: \(age) год\n")
  }
}
printtheAge(enterTheAgeFrom1To150: "55")

// 7. С клавиатуры вводятся числовые координаты двух полей шахматной доски (x1,y1,x2,y2). Требуется определить, относятся поля к одному цвету или нет.

func defineTheCommonColor(x1: Int, y1: Int, x2: Int, y2: Int) {
  print("7th task.\n----------")
  if (x1 + y1 + x2 + y2) % 2 == 0 {
    print("Result: all fields have a black color\n")
  } else {
    print("Result: fields have different colors\n")
  }
}
defineTheCommonColor(x1: 1, y1: 1, x2: 2, y2: 2)

// 8. Ввести a и b и вывести квадраты и кубы чисел от a до b.

func calculateSquareAndCube(a: Int, b: Int, enterTheType squareORcube: String) {
  print("8th task.\n----------")
  let range = a...b
  if squareORcube == "square" {
    for i in range {
      print("\(i) squared = \(i * i)\n")
    }
  } else if squareORcube == "cube" {
    for i in range {
      print("\(i) cubed = \(i * i * i)\n")
    }
  } else {
    print("Wrong type has been entered! Enter square or cube\n")
  }
}
calculateSquareAndCube(a: 1, b: 4, enterTheType: "cube")

// 9. Даны целые положительные числа N и K. Используя только операции сложения и вычитания, найти частное от деления нацело N на K, а также остаток от этого деления.

func findTheResult(n: Int, k: Int) {
  print("9th task.\n----------")
  var a = n
  let b = k
  var resultOfDivision = 0
  if a > b && b > 0 {
    while a >= b {
      a = a - b
      resultOfDivision += 1
    }
  }
  print("The result of the division = \(resultOfDivision)\n")
  print("The remainder of the division = \(a)\n")
}
findTheResult(n: 6, k: 3)

// 10. Дано целое число N (> 0). С помощью операций деления нацело и взятия остатка от деления определить, имеются ли в записи числа N нечетные цифры. Если имеются, то вывести True, если нет — вывести False.

func findTheResult2(n: Int) {
  print("10th task.\n----------")
  let a = n
  var b = 0
  var c = 1
  b = a
  while b > 10 {
    b = b / 10
    c = c * 10
  }
  while c > 1 {
    if (a % c) % 2 == 0 {
      c = c / 10
    }
    if (a % c) % 2 == 1 {
      print("Result: True. n contains odd numbers\n")
      c = 0
    }
  }
  if c != 0 {
    print("Result: False. n contains only even numbers\n")
  }
}
findTheResult2(n: 222)

// 11. С клавиатуры вводятся числа, пока не будет введен 0. Подсчитать среднее арифметическое всех положительных четных чисел, оканчивающихся на 8.
// Не понял как реализовать на Swift, было бы неплохо разобрать на 2м уроке на языке Swift.

// 12. Написать функцию нахождения максимального из трех чисел.

func findTheMaxNumberUsingMax2(number1: Int, number2: Int, number3: Int) {
  print("12th task.\n----------")
  let maxNumber = max(number1, number2, number3)
  print("Result: max number = \(maxNumber)\n")
}
findTheMaxNumberUsingMax2(number1: 2, number2: 3, number3: 4)

// 13. * Написать функцию, генерирующую случайное число от 1 до 100. а) с использованием стандартной функции rand() б) без использования стандартной функции rand()
// 1st solution using rand():

func generateRandomNumber() {
  print("13th task.\n----------")
  let randomNumber = arc4random_uniform(UInt32(100))
  print("Solution 1 using random():\nResult: Random number = \(randomNumber)\n")
}
generateRandomNumber()

// 2nd solution using Xoroshiro128Plus algorithm (есть ли более простой способ на Swift?):

struct RNG {
  var seed: UInt64
  var rngState: [UInt64] = [0, 0]
  var generator: Xoroshiro128Plus
  
  init(seed: UInt64 = UInt64(NSDate().timeIntervalSinceReferenceDate)) {
    self.seed = seed
    self.generator = Xoroshiro128Plus(state: [0, 0])
    generateSeeds(seed: seed)
    self.generator.state = rngState
    getRandomNumber()
  }
  
  private mutating func generateSeeds(seed: UInt64){
    var seeder = SplitMix64(state: seed)
    var statePart: UInt64
    
    for x in 0...10 {
      statePart = seeder.nextSeed()
      rngState[0] = x == 9 ? statePart : 0
      rngState[1] = x == 10 ? statePart : 0
    }
  }
  
  mutating func getRandomNumber(min: UInt64 = 0, max: UInt64 = UInt64.max - 1) -> UInt64 {
    return generator.next() % (max - min + 1) + min
  }
}

struct Xoroshiro128Plus {
  
  var state: [UInt64]
  
  func rotateLeft(a: UInt64, b: UInt64) -> UInt64 {
    return (a << b) | (a >> (64 - b))
  }
  
  mutating func next() -> UInt64 {
    let s0: UInt64 = state[0]
    var s1 = state[1]
    let result: UInt64 = s0 &+ s1
    
    s1 ^= s0
    state[0] = rotateLeft(a: s0, b: 55) ^ s1 ^ (s1 << 14)
    state[1] = rotateLeft(a: s1, b: 36)
    
    return result
  }
  
}

struct SplitMix64 {
  
  var state: UInt64
  
  mutating func nextSeed() -> UInt64 {
    var b: UInt64 = state &+ 0x9E3779B97F4A7C15
    b = (b ^ (b >> 30)) ^ 0xBF58476D1CE4E5B9
    b = (b ^ (b >> 27)) ^ 0x94D049BB133111EB
    state = b ^ (b >> 31)
    return state
  }
}
var rng = RNG()
print("Solution 2 using Xoroshiro128Plus algorithm:\nResult: Random number = \(rng.getRandomNumber(min: 1, max: 100))")

// 14. *Автоморфные числа. Натуральное число называется автоморфным, если оно равно последним цифрам своего квадрата. Например, 252 = 625. Напишите программу, которая вводит натуральное число N и выводит на экран все автоморфные числа, не превосходящие N.
// Не смог решить, было бы полезно разобрать на 2м уроке на языке Swift.

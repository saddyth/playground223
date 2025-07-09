//
//  main.swift
//  playground223
//
//  Created by pulino4ka ✌🏻 on 7.7.2025.
//
import Foundation

//Task 1.1
//Сумма чисел
//Создайте замыкание, которое принимает два числа и возвращает их сумму.

let closureSum = {(a: Int, b: Int) in
    return a + b
}
print(closureSum(5, 3))


//Task 1.2
//Умножение на константу
//Создайте замыкание, которое умножает число на заданную константу.
let const = 5
let closureMultiply: (Int) -> Int  = { a in
    return a * const
}

print(closureMultiply(5))


//Task 1.3
//Поиск максимального числа
//Создайте замыкание, которое принимает массив чисел и возвращает максимальное значение.

var arr = [1,2,4,2,2,5,3,1]
let closureMax = { (array: [Int]) -> Int in
    var maxNum = array[0]
    for value in array {
        if value > maxNum {
            maxNum = value
        }
    }
    return maxNum
}

print(closureMax(arr))

//Task 1.4
//Фильтрация четных чисел
//Создайте замыкание, которое фильтрует четные числа из массива.

let closureOdd = arr.filter { $0 % 2 != 0}
print(closureOdd)

//2 вариант
var unfilteredArr = [1,2,4,2,2,5,3,1]

let closureOdd2 = { (array: [Int]) -> [Int] in
    var oddArr = [Int]()
    for value in array {
        if value % 2 != 0 {
            oddArr.append(value)
        }
    }
    return oddArr
}

print(closureOdd2(unfilteredArr))


//Task 1.5
//Приветствие
//Создайте замыкание, которое выводит приветствие для имени.

let greetingClosure: (String) -> Void = {
    print("Hello, \($0)")
}

greetingClosure("Polina")


//Task 2.1
//Сортировка массива
//Создайте замыкание, которое сортирует массив чисел по возрастанию или убыванию.

var arrSort = [1,5,3,1]
let closureSort = { (arr: [Int]) -> [Int] in
   return arr.sorted { $0 > $1}
}
print(closureSort(arrSort))


//Task 2.2
//Подсчет слов
//Создайте замыкание, которое подсчитывает количество слов в строке.

let str = "Hello my name is"

let wordCount = {(str: String) -> Int in
    return str.split(separator: " ").count
}

print(wordCount(str))

//Task 2.3
//Вычисление факториала
//Создайте замыкание, которое вычисляет факториал числа рекурсивно.


var factorialClosure = { (number: Int) -> Int in
    
    if number <= 1 {return 1}
    return number * factorialClosure(number - 1)
}

print(factorialClosure(5))



//Task 2.4
//Конвейер обработки
//Создайте замыкания для умножения, сложения и вычитания, затем объедините их в конвейер обработки.

let multiply: (Int, Int) -> Int = { $0 * $1}
let sum: (Int, Int) -> Int = { $0 + $1}
let minus: (Int, Int) -> Int = { $0 - $1}
let closureArr: [(Int, Int) -> Int] = [multiply, sum, minus]

func runConveyor(array: [(Int, Int) -> Int], num1: Int, num2: Int) -> Int {
    var result = num1
    for operation in array {
        result = operation(result, num2)
    }
    return result
}

print(runConveyor(array: closureArr, num1: 2, num2: 2))


//Task 2.5
//Реверс строки
//Создайте замыкание, которое переворачивает строку.

let reversedString: (String) -> String  = { String($0.reversed()) }

//let reversedString = { (text: String) -> String in
//    return String(text.reversed())
//}

print(reversedString("Hello"))


//Task 3.1
//Мемоизация
//Реализуйте функцию мемоизации для замыкания, которая кэширует результаты предыдущих вычислений.
//

var dict = [Int: Int] ()

var factorialClosure1 = { (number: Int) -> Int in
    
    if number <= 1 {return 1}
    
    if let result = dict[number] {return result}
    dict[number] = number * factorialClosure1(number - 1)
    return dict[number]!
}

print(factorialClosure1(10))
print(factorialClosure1(5))

//Task 3.2
//Асинхронная загрузка данных
//Создайте замыкание, которое имитирует асинхронную загрузку данных с сервера.

let loadData = { (completion: @escaping (String) -> Void) -> Void in
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){ 
        let textData = "ffkfkgj"
        completion(textData)
    }
}


loadData { result in
    print("Получено \(result)")
}


//Task 3.3
//Композиция замыканий
//Напишите функцию композиции двух замыканий.

let multiplyComp: (Int) -> Int = { $0 * 2}
let sumComp: (Int) -> Int = { $0 + 5}

func composition(closure1: @escaping (Int) -> Int, closure2: @escaping (Int) -> Int ) -> (Int) -> Int {
    return { (num: Int) -> Int in
        let closure1Result = closure1(num)
        return closure2(closure1Result)
    }
}

let combinedClosure = composition(closure1: multiplyComp, closure2: sumComp)
print(combinedClosure(5))


//Task 3.4
//Фильтр и преобразование
//Создайте замыкание, которое фильтрует массив чисел и преобразует их.

var numberArray = [4,3,1,2,6]

let closureFilter = { (arr: [Int]) -> [String] in
    return arr.filter { $0 % 2 == 0}.map {"Число \($0)"}
}

print(closureFilter(numberArray))

//Task 3.5
//Цепочка событий
//Создайте замыкание, которое обрабатывает цепочку событий (например, кнопка нажата, текст изменен).
enum Event {
    case btnDown
    case textChanged
    case colorChanged
}
func btnDown() {
    print("Кнопка нажата")
}

func textChanged() {
    print("Текст изменен")
}

func colorChanged() {
    print("Цвет изменен")
}

let checkEvent = { (event: Event) -> Void in
    switch event {
    case .btnDown:
        btnDown()
    case .textChanged:
        textChanged()
    case .colorChanged:
        colorChanged()
    }
    
}

checkEvent(Event.btnDown)

//Task 4.1
//Счетчик вызовов
//Создайте замыкание, которое считает количество своих вызовов.

var countCall = 0

let countClosure: () -> Int = {
    countCall += 1
    return countCall
}

print(countClosure())
print(countClosure())
print(countClosure())
print("Число вызывов \(countCall) ")

//Task 4.2
//Проверка пароля
//Создайте замыкание, которое проверяет пароль на соответствие правилам (минимальная длина, наличие цифр и букв).

let password = "dsfk11dsfJFJFjng"


let checkPswd = { (passwd: String) -> Void in
    let range = NSRange(location: 0, length: passwd.utf16.count)
    let patternRegex = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])"
    let regex = try! NSRegularExpression(pattern: patternRegex)
    if passwd.count >= 5 && regex.firstMatch(in: passwd, range: range) != nil {
        print("Пароль надежный")
    } else{
        print("Пароль ненадежный")
    }

}

checkPswd(password)

//Task 4.3
//Генератор случайных чисел
//Создайте замыкание, которое генерирует случайные числа в заданном диапазоне.


let randomNum = {(from: Int, to: Int) -> Int in
    return Int.random(in: from...to)
}

print(randomNum(1,10))

//Task 4.4
//Обработка ошибок
//Создайте замыкание, которое обрабатывает ошибки и возвращает результат или сообщение об ошибке.

enum Errors: String, Error {
    case invalidInput
    case emptyString
}

let catchError: (String) throws -> String = { text in
    if text.isEmpty {
        throw Errors.emptyString
    } else if text.contains("1"){
        throw Errors.invalidInput
    } else {
        return text.lowercased()
    }
    
}

do {
    let result = try catchError("1ffd")
    print(result)
} catch {
    print(error)
}

//Task 4.5
//Рекурсивное замыкание
//Создайте рекурсивное замыкание для вычисления суммы всех чисел от 1 до N.

var dictMemo = [Int: Int] ()
let recursiveClosure = { (to: Int) -> Int in
    if to <= 0 {
        return 0
    } else if to == 1 {
        return 1
    }
    
    if let result = dictMemo[to] {return result}
    dictMemo[to] = to + recursiveClosure(to - 1 )
    return dictMemo[to]!
}

print(recursiveClosure(5))

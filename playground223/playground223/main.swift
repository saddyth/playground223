//
//  main.swift
//  playground223
//
//  Created by pulino4ka ✌🏻 on 7.7.2025.
//

import Foundation


let closure: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}

let closure1: (Int, Int) -> Int = {
    $0 + $1
}

func some(closure: (Int, Int) -> Int)  {
    let result = closure(1,2)
    print(result)
}

some(closure: -)


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
var oddArr = [Int]()
let closureOdd2 = { (array: [Int]) -> [Int] in
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

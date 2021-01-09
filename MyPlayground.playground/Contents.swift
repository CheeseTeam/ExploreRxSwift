//: Playground - noun: a place where people can play

import UIKit

let stringArray = ["1", "2", "3", "4", "5", "6", "7"]
let fullFilter = stringArray.flatMap { Int($0) }.filter { $0 % 2 == 0 }
print(fullFilter)
let patialArray = stringArray[4..<stringArray.count].flatMap { Int($0) }.filter { $0 % 2 == 0 }
print(patialArray)

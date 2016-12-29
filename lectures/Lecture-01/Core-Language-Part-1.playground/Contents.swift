/*:
## CSCI E-65: Mobile Applications using Swift and iOS
### Lecture 1 25 January 2016
### Harvard Extension School /*
#### Daniel Bromberg -- bromberg@fas.harvard.edu
*/ */

import UIKit

// In playground, unlike real projects, you can create any expression, and have it immediately evaluated
3 + 4 + 2
12 - 3 * (4 - 18)
var w: String
w = "world"
("Hello" + ", ") + w // Operator overloading: function called Depends On The Type Of Arguments

// Like many languages, we have integer division and integer modulo
1201 / 3
76 % 25
4.3 / 8.6
1 / 2
var infinity = 2.0 / 0.0
infinity + 1
infinity + 1 == infinity
sqrt(-1.0) * 3

sqrt(7.0) // but not sqrt(7); it's a floating point op not applicable to Ints

// Let's make some real statements now, and rely on type inteference
var anInferredInt = 3
var anInferredDouble = 0.1

// Swift is much stricter than other languages about combining types
// anInferredInt / anInferredDouble // Understand this error
// This is not a cast; it's a constructed Double using the Int as the argument
var whatIsThis = Double(anInferredInt)/anInferredDouble



let a = [ 1, 2, 3, 4, 5, 6, 7 ] // What is the inferred type?
// Let's do it in two explicit steps (teaching purposes only: failing to use inference when it's possible will have points taken off)

let letA = [Int]() // Array constructor syntax
// letA.append(3) // Important to understand why this fails
var varA: [Int] = [Int]()
varA.append(3)
varA.append(2354)
varA.count
var varB = varA.dropLast()
varA
varB
// Arrays are by copy! As are structs and Dictionaries

// Arrays of strings are easy and can add new strings of any length
var arrStr = ["My", "pet", "dog"]
arrStr.insert("Rover", atIndex: 3)
// let's try some bounds errors
// arrStr[-1]
// arrStr[4]
arrStr.append("abc")
arrStr.append("4")

// overloaded operator, combined with arrays:
arrStr[1] + " " + arrStr[2]
arrStr.joinWithSeparator(" ")

// Let's dive into some functional programming style. Functional programming revolves around two principles:
// A. Calculating new values, rather than mutating existing values
// B. Using functions the same way all other types are used: passing as parameters, creating dynamically

// Demonstrates the 'map' Swift Standard library function, and BLOCKS
// BLOCKS are anonymous (unnamed) functions.  They also act as CLOSURES in that they capture and store values in their environment which would otherwise be temporary.
// They are often referred to as such, but we'll get to that much later

a
// Version 1:
// internal hidden indexing variable has taken on 8 values: 0...7
let squaresOfA = a.map({ (x: Int) /* -> Int */ in return x * x })
squaresOfA

// Take advantage of implicit return: single-expression blocks implicitly return the value
let b2 = a.map({ (x: Int) in x * x })
b2

// Take advantage of automatic parameter naming
let b3 = a.map({ $0 * $0 })
b3

// Take advantage of block-as-last-param-can-go-after-close-paren syntax
let b4 = a.map { $0 * $0 }
b4

//normal named function
func calcSquare(input: Int) -> Int {
    return input * input
}
// Reduce example depending on time
let b5 = a.map(calcSquare)

// OPTIONALS
// A sentinel value embedded into the type, with simple syntax to unwrap when you need
var x: Int?

print("\(x)")

x = 3 // Store something in the box: not the same as var y: Int = 3
x = nil
// print("\(x) \(x!)")
//x+1

// Use in expressions:
//x! + 5

// But now:
x = 5

// OOPS -- note playground evaluation halts
// x! + 5
var y: Int?
if y != nil {
    print("\(x!)")
}
else {
    print("no value")
}

if let okx = x { // type of okx is an Int, no need to keep unwrapping
    print("\(okx)")
    x = nil
    print("\(okx)")
    x = 6
    print("\(okx)")
}
else {
    print("no value")
}

// Example:
func optsqrt(operand: Double) -> Double? {
    if operand >= 0 {
        return sqrt(operand)
    }
    else {
        return nil
    }
}

optsqrt(-3)


// Dictionaries
var dict = [ "Apple": 3.25, "Pear": 2.99, "Banana": 0.75 ] // what's the inferred type?
// Optionals come into play
dict["Apple"] // Playgrouynd output is misleading
dict["Paer"]
print(dict["Apple"])
print(dict["Apple"]!) // unwrap
if let priceOfApple = dict["Apple"] {
    print("Price per pound of apples is \(priceOfApple)")
}

// Composable: Array of dictionaries, array of arrays, dictionary of keys -> arrays, etc.

// for loops: Old style
for var val = 10; val <= 120; val += 6 {
    print(val)
}
// Collection-style
for val in 1..<10 { // 1..<10 is an object literal of type Range!
    print(val)
}
for val in 10.stride(through: 120, by: 6) {
    print(val)
}

// enumerated types: a set of values that are not primitive, and one can list them all finitely & easily ("enumerable")
// Enumerate over the cardinal directions: NWES; over the suits of a deck of cards; over the months of a year

enum Powers: Int {
    case Thousand = 1000
    case Million = 1000000
}

// wrapping data: tuples, structs, classes
// value versus reference semantics

// computed properties: temperature example
(212 - 32) * 5.0 / 9.0

// property observers

// Extensions!
extension Int {
    func moduloThree() -> Int {
        return self % 3
    }
}

print("\(4.moduloThree())")

// http://stackoverflow.com/questions/24051314/precision-string-format-specifier-in-swift

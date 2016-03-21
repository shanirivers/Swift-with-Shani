//: Playground - noun: a place where people can play

import Cocoa
// function def:  is a named set of code used to accomplish 
//some specific task also called a "named closure"
// Basic function  
func printGreeting()
{
    print("Hello, playground")
}

printGreeting()

// Function with parameters - parameters give func some inputs, takes data to execute task &/ 
// produce a result
func greeting (name: String)
{
    print("Hello there, \(name)")
}

greeting("Phil")

// Functions without parameters

func sayHelloWorld() -> String {
	return "Hello, World"
	}

// Function with multiple return values - tuple type as return for a func  - compound return value
// tuple is a logic grouping  order list of elements

func sortNumbers (numbers: [Int]) -> (even: [Int], odd: [Int]) {
    var evenNumArray = [Int]()
    var oddNumArray = [Int]()
    
    // loop that will look at the number and determine if it is even or odd
    for number in numbers {
        if number % 2 == 0 {
            evenNumArray.append(number)
        } else {
            oddNumArray.append(number)
        }
    }
    
    return (evenNumArray, oddNumArray)
}

let listOfNumbers = [12,13,456,185,15,4,2,789,25,24,6]

sortNumbers(listOfNumbers)

let sortedListOfNumbers = sortNumbers(listOfNumbers)

print("The odd numbers are :     \(sortedListOfNumbers.odd)")

print("The even numbers are :     \(sortedListOfNumbers.even)")

// Function with optional tuple return types - if tuple return has possiblity that it 
// to be nil, than use an optional add ? to end of return tuple

func findMinMax (numbers: [Int]) -> (min: Int, max: Int)? {
    var currentMin = 0
    var currentMax = 0
    
    for number in numbers [1..<numbers.count] {
        if number < currentMin {
            currentMin = number
        } else if number > currentMax {
            currentMax = number
        
        }
    }
    return (currentMin, currentMax)
}

findMinMax([9,9,9])
findMinMax([])



// Function with explicit parameter names// Functions with multiple parameters
func perimeterOfRectangle(forLength len:Double, forWidth wth: Double)
{
    print("A rectangle's perimeter when length is \(len) and width is \(wth) equals 
    \(2.0 * (len + wth))")
}
// Function with explicit parameter names -----------------

func division (numerator num: Double, denominator den: Double) -> Double {
    return num / den
}

division(numerator: 5, denominator: 2)


func addition (aNumber: Int, _ anotherNumber: Int) -> Int {  // Omit external names use "_"
    return anotherNumber + aNumber
}

addition(3, 5)



// Variadic parameters - takes 0 or more values in its argument tack on "..."
func greetingsLanguageLearners(lang: String, names: String...)
{
    for name in names {
        print("Hello there, \(name). Welcome to Swift.")
    }
}
greetingsLanguageLearners("Swift", names: "Bob", "Cindy", "Alex")

// Default values for function parameters, should be placed at end of func's para list
func division (forNumerator num: Double, forDenominator den: Double, forSign sign: String = "÷")
{
    print("\(num) \(sign) \(den) equals \(num / den)")
}

division(forNumerator: 6, forDenominator: 3)
division(forNumerator: 6, forDenominator: 3, forSign: "divids")







// In-out parameters: modify the value of an argument, in-out paras allow a function's 
//impact on a variable to live beyond the func's body
// Error code example
var errorMessage = "The request has failed: "

func addErrorCode (code: Int, inout toErrorString errorString: String)
{
    if code == 400 {
        errorString += "Bad request."
    }
}

addErrorCode(400, toErrorString: &errorMessage) // & (ampersand) indicates that the 
//variable will be modified by the function

errorMessage

// Simple example of inout
var name = "Bobby "

func addLastName (lastName: String, inout toFullName nameString: String)
{
    name += lastName
}

addLastName("Smith", toFullName: &name)
name

// Swapping values
var fruit = "Lettuce"
var vegatable = "Apple"
func swapValues (inout firstObj: String, inout secondObj: String)
{
    let temp = firstObj
    firstObj = secondObj
    secondObj = temp
}

swapValues(&fruit, secondObj: &vegatable)
fruit
vegatable

// Return from a function - you give info and after it does some work, it returns some 
// data, challenge is to replace all of the print()s inside of the functions above
func returnPerimeter(forLength len:Double, forWidth wth: Double) -> String
{
    return "The rectangle's perimeter when length is \(len) and width is \(wth) equals \(2.0 * (len + wth))"
}

print(returnPerimeter(forLength: 12, forWidth: 14))
var rectangle = returnPerimeter(forLength: 12, forWidth: 14)



// Every function has a type, made up of parameter and return types. 

(Int, Int) -> Int 
// In english: A function type that has two parameters, both of type Int and returns a value of 
// type Int

() -> ()
// In english: A type of this function is a func that has no parameters and returns void


// Using function types - every func has a type, made up of para types and return type 
//of the func

var mathFunction = dividTwoNumbers

mathFunction(numerator: 30, denominator: 15)

var anotherMathFunction: (Int, Int) -> Int

anotherMathFunction = addTwoNumbers


anotherMathFunction(2, 3)


func substractTwoNumbers (aNum: Int, bNum: Int) -> Int {
    return aNum - bNum
}

anotherMathFunction = substractTwoNumbers

anotherMathFunction(2, 3)



// Function types as Parameter Types

func printMathResult (mathFunction : (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult



// Function types as Return Types


func moveOneToRight(input: Int) -> Int {
    return input + 1
}

func moveOneToLeft(input: Int) -> Int {
    return input - 1
}

//The the func returns either left or right function dependent on whether the func's boolean parameter for it is true or false:
func chooseMovementFunction (moveLeft: Bool) -> Int -> Int {
    return moveLeft ? moveOneToLeft : moveOneToRight
}

var currentValue = -3
let moveCloserToZero = chooseMovementFunction(currentValue > 0)

print("Moving to origin:")
while currentValue != 0 {
    print(currentValue)
    currentValue = moveCloserToZero(currentValue)
}
print(currentValue)


























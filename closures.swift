// CLOSURES
/*
Differ from functions, they're more compact and lightweight and allow you to write w/o 
having to give it a name or a full function declaration therefore easy to pass around

*/


// Closure = discrete bundle of functionality

// CLOSURE EXPRESSION SYNTAX:
/*

With a return:
{ (parameters) -> return type in
// Some code statements

With no return:

{(parameters) in
// Some code statements
}

*/

var noParametersOrReturnValue: () -> () = {
    print("I have no parameters or return values, so I'm outputting this with a print statement")
}

var noParametersAndOneReturn: () -> (String) = {
    return "I return a string, but I have no parameters"
}

var oneParametersAndOneReturn: (String) -> (String) = { name -> String in
    return "Hi, \(name)"
}

var multipleParametersAndOneReturn: (String, String) -> String = { (firstName, lastName) 
-> String in
    return firstName + " " + lastName
}

var oneParameterAndMultipleReturns: ([Int]) -> (even:[Int], odd:[Int]) = { (numbers) -> 
([Int], [Int]) in
    var evenNumArray = [Int]()
    var oddNumArray = [Int]()
    
    for number in numbers {
        number % 2 == 0 ? evenNumArray.append(number) : oddNumArray.append(number)
    }
    return (evenNumArray, oddNumArray)
}

/*

INFERRING TYPE FOR PARAMETERS AND RETURNS
Don't need to declare the type of each parameter so you don't need to state the 
type of the closure because it can be inferred

*/

var noParametersOrReturnValue_Inferred = {
    print("I have no parameters or return values, so I'm outputting this with a print statement")
}

var noParametersAndOneReturn_I = {
    return "I return a string, but I have no parameters"
}

var oneParametersAndOneReturn_I = { (name: String) -> String in
    return "Hi, \(name)"
}

var multipleParametersAndOneReturn_I = { (firstName: String, lastName: String) -> String in
    return firstName + " " + lastName
}

var oneParameterAndMultipleReturns_I = { (numbers: [Int]) -> ([Int], [Int]) in
    var evenNumArray = [Int]()
    var oddNumArray = [Int]()
    
    for number in numbers {
        number % 2 == 0 ? evenNumArray.append(number) : oddNumArray.append(number)
    }
    return (evenNumArray, oddNumArray)
}

/*
SHORT-HAND PARAMETER NAMES

Example using sort(_:), an array method, takes a closure that will describe how
the sorting should be done using < or >, asc or desc, returns a boolean and a new array
sorted as requested

*** I will be covering higher-order functions in more detail in another video, but sort as
well as, map, filter, and reduce are also like sort - they take @ least one func as an 
input
*/


var gameScores = [342, 463, 513, 4053, 5003, 10293, 3, 45, 120394]

// the func type for sort is ((Int, Int) -> Bool) -> [Int]

// The LONG version

func sortAscending (i: Int, j: Int) -> Bool {
    return i > j
}

let gameScoresSorted = gameScores.sort(sortAscending)

// Refactor sortAscending function to a closure inline

let gameScoresSortedWithClosure = gameScores.sorted(by: {
    (i: Int, j:Int) -> Bool in
        return i > j
})



gameScoresSortedWithClosure

// Refactor again using type inference

let gameScoresSortedInferred = gameScores.sorted(by: { i, j in i > j})
gameScoresSortedInferred

// Short-hand parameter names
/*
Shorthand Argument Names

Swift automatically provides shorthand argument names to inline closures, which can be used
 to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.

If you use these shorthand argument names within your closure expression, you can omit 
the closure’s argument list from its definition, and the number and type of the shorthand 
argument names will be inferred from the expected function type. The in keyword can also 
be omitted, because the closure expression is made up entirely of its body:


Here, $0 and $1 refer to the closure’s first and second String arguments.


*/

var gamesScoresSortedShort = gameScores.sorted(by: { return $0 > $1}) // $2, $3..
gamesScoresSortedShort


// CAPTURING VALUES 

/* 

Closures can capture constants & variables from surrounding context 
in which it's defined


It can refer to and modify the values of the const/variables from within its body
even if the original scope has defined them doesn't exist any more
*/
//GLOBAL

var aNumber = 2

var multiplyByTwo = {
    aNumber *= 2
}

var printNumber = {
    print(aNumber)
}

var oneNumber =  10
var anotherNumber = 10
printNumber()
multiplyByTwo()
multiplyByTwo()
printNumber()

// INTERNAL
// Not in a global context, closures and func track internal info 
// encapsulated by a variable defined in their enclosing scope

/*
Simplest form of a closure that can capture values is a nested function

*/

// Internal - nested function (simplest form of closure)
func makeDeduction (start: Int, step: Int) -> () -> Int {
    var total = start
    func subtractor () -> Int {
        total -= step
        return total
    }
    
    return subtractor
}

var someRandomNumber = 100
var decreasing = makeDeduction(start: 10, step: 2)
decreasing()
decreasing()
someRandomNumber += decreasing()

var decreasingAgain = makeDeduction(start: 1, step: 2)
decreasingAgain()
decreasingAgain()
someRandomNumber += decreasingAgain()



// Another example

func increaseCellCount (forCount startCount: Int) -> () -> Int {
    var totalCount = 0
    func growthTracker () -> Int {
        totalCount += startCount
        return totalCount
    }
    return growthTracker
}

var cellCultureCount = 503
let growBy100 = increaseCellCount(forCount: 100)
growBy100()
growBy100()
cellCultureCount += growBy100()

var anotherCellColony = 123
let growBy20 = increaseCellCount(forCount: 20)
growBy20()
growBy20()
anotherCellColony += growBy20()


// Closures are reference types - means that you set that constant/var to point to a func 
// (not creating a copy
//therefore if func is called by another var/const leads to a change in scope
/*
Closures are reference types. This means that when you assign a closure to more than one
 variable they will refer to the same closure or point to that func. 
 This is different from value type which make a copy when you assign them to another 
 variable or constant.
*/

// a closure that take one Int and return an Int
var double: (Int) -> (Int) = { x in
return 2 * x
}

double(2) // 4

// you can pass closures in your code, for example to other variables
var alsoDouble = double

alsoDouble(3) // 6



// Another example using the cell tracker
let anotherGrowBy100 = growBy100
anotherGrowBy100()
var someOtherPopulation = 406
let growBy1000 = makeCellCountTracker(forCount: 1000)
someOtherPopulation += growBy1000()
currentPopulation

// Another worked example
var myClosure = {
    print("I'm printing")
}

func applyKTimes(K: Int, _ closure: ()->()) {
    
    for _ in 1...K {
        closure()
    }
}

applyKTimes(2, myClosure)
applyKTimes(3, myClosure)
 


// TRAILING CLOSURES
/*
    If you need to pass a long closure expression as a function's final arg then write a "trailing" closure,
    it's basically a closure written after and outside the paratheses of the func it supports

    Syntax: */

    func someFuncThatTakesClosure (Closure: () -> Void) {
        // func body here
    }

//Without a trailing closure:
    someFuncThatTakesClosure ({
        // closure body here
    })

//With a trailing closure:
    someFuncThatTakesClosure(){ /* trailing closure body here */ }


// EXAMPLE

func sum (begin: Int, end: Int, f: (Int) -> Int) -> Int {
    var sum = 0
    for i in begin...end {
        sum += f(i)
    }
    return sum
}

// sum of 1st 5 squares
sum (1, end: 5){ $0 * $0 }

// sum of 1st 10 numbers
let sumNumber = sum(1, end: 10) { $0 }
sumNumber




// HIGHER ORDER FUNCTIONS

// sort(_:)
let names = ["Bob", "Mary", "Joe", "Sue", "Evie"]
var sortNamesAsc = names.sort()
var sortNamesReversed = names.sort() { $0 > $1 }
sortNamesReversed


// map(_:) - transforms an array using a function, map contents from one value to another
/* takes a closure expression as its single argument & returns an alternate mapped value (of the same or
    different type) for that itme in a new array containing new mapped values
*/

let digitNames = [ 0: "zero", 1: "one", 2: "two", 3: "three"]
let numbers = [1,2,3,0]

let numberNames = numbers.map {
    (number) -> String in
    var output = ""
    output = digitNames[number]! + output
    return output
}

// Another example - *** MAKE SURE TO MENTION THAT THE Cocoa LIBRARY IS USED ***
// var myLabel = NSTextField(frame: CGRectMake(0,0,200,50))
// 
// myLabel.backgroundColor = NSColor.purpleColor()
// let colorNames = [ "red": NSColor.redColor(), "blue": NSColor.blueColor(), "green": NSColor.greenColor(),
//     "orange": NSColor.orangeColor(), "purple": NSColor.purpleColor()]
// 
// let colorStrings = ["blue", "green", "red", "orange", "purple"]
// 
// let colors = colorStrings.map {
//     (stringNames) -> NSColor in
//     var output: NSColor
//     output = colorNames[stringNames]!
//     return output
// }
// 
// myLabel.backgroundColor = colors[0]
// myLabel.backgroundColor = colorNames["red"]

//: UPDATED CODE FOR SWIFT 3

var myLabel = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 50))
myLabel.backgroundColor = NSColor.purple

let colorNames = ["red": NSColor.red, "blue": NSColor.blue, "purple": NSColor.purple]
let colorStrings = ["red", "blue", "purple"]


let colors = colorStrings.map { (stringNames) -> NSColor in
    var output: NSColor
    output = colorNames[stringNames]!
    return output
}

colors

myLabel.backgroundColor = colors[2]

// filter(_:) - selects elements of array which satisfy a certain condition, like map, can be 
// called on
/*  an instance of array type. Takes closure as an arument, to filter the array upon some criteria
, resulting array will contain values of original array that passed test*/
let gameScoresTop3 = [45,18,250,3,7854,123,10524,345,25004]

// filter games scores that are greater then 1000 

// sort games scores first 

//let descGameScores = gameScoresTop3.sort { $0 > $1 }
//descGameScores

// then filter for top 3 scores using sort
let top3Scores = gameScoresTop3.filter {
    (score: Int) -> Bool in
    var sorted = gameScoresTop3.sort { $0 > $1 }
    return score > sorted[3]
}

top3Scores

// reduce(_:combine) - combines the value of an array into a single value

var sayThis = ["Swift", "With", "Shani", "is", "fun!"]

let string = sayThis.reduce("") {
    if $0 == "" {
        return $1
    } else {
        return $0 + " " + $1
    }
}
string

// FIND largest number from gameScores and then print it

let maxScore = gameScores.reduce(gameScores[0]) { $0 > $1 ? $0 : $1 }

maxScore

// FIND all the sum of squares of all odd numbers from numbers array and then print it using map, reduce and filter

var someNumbers = [3, 2, 5, 19, 30, 23, 9, 12]

var filteredNum = someNumbers.filter { (num: Int) -> Bool in
    return num % 2 != 0
}

var mappedNum = filteredNum.map{
    (num) -> Int in
    return num * num
}

var reducedNum = mappedNum.reduce(0) { (i: Int, j: Int) -> Int in
    return i + j
    }

reducedNum

// Refactor

let sum = someNumbers.filter { (num: Int) -> Bool in
    return num % 2 != 0
    }.map { (num) -> Int in
        return num * num
        
    }.reduce(0) { (i: Int, j: Int) -> Int in
        return i + j
}
sum

// Refactor again using short-hand parameter names

let shortHandSum = someNumbers.filter { $0 % 2 != 0
    }.map { $0 * $0
    }.reduce(0) { $0 + $1 }

shortHandSum



/*  NONESCAPING CLOSURE - a closure is said to escape a func when it's passed as an argument
                          to the func BUT is called after the func returns

// PULP FICTION REFERENCE: JULES & VINCENT - @noescape tells the compiler that the passed-in 
closure can NOT be used outside the func
its passed into, enables control-flow-like functions to be more transparent about their behavior
*/

// SYNTAX
func someFunction (@noescape someClosure: () -> Void) {
    // some code
}

// An example of a method that has a @noescape, sort(_:)
var someArray = ["Pitt", "Brett", "Mr. Wallace"]
var array = someArray.sort({i, j in i > j})

array

/* JULES (Autoclosure) & VINCENT (noescape) - @noescape tells the compiler that the passed-in closure
can NOT be used outside the func its passed into, enables control-flow-like functions to be more 
transparent about their behavior */

var closureVariable: (() -> Void)?

func prepareToTakeBriefcase (@noescape avengence: () -> Void) {
    // 1. Can't store it
//    closureVariable = avengence
    
    // 2. Can't capture it in another non-@noescape closure
//    tryToLetTheClosureEscape(avengence)
//    tryToLetTheClosureEscape() {
//        prep ()
//    }
    
    // 3. Can't run asynchronously
//    dispatch_async(dispatch_get_main_queue(), avengence)
    
    // But you can capture it in another function that has a @noescape closure as a parameter
    
}

func tryToLetTheClosureEscape(@noescape fleeingClosure: () -> ()) {
//    closureVariable = fleeingClosure
}



/* AUTOCLOSURE - is a closure the automatically created to wrap an expression passed in as an 
argument to a function. When called it returns the value of the expression wrapped inside it.

*/


//Consider a function that takes one argument, a simple closure that takes no argument:

func f(pred: () -> Bool) {
    if pred() {
        print("It's true")
    }
}
///To call this function, pass in a closure

f({2 > 1})
// "It's true"
//If we omit the braces, we are passing in an expression and that creates an error:

//f(2 > 1)  // error: could not find an overload for '>' that accepts the supplied arguments

/*@autoclosure creates an automatic closure around the expression - syntactic convenience. 

So when the caller writes an expression like 2 > 1, it's automatically wrapped into a closure 
to become {2 > 1} before it is passed to f. So if we apply this to the function f: */


func f(@autoclosure pred: () -> Bool) { // show (escaping) too 
    if pred() {
        print("It's true")
    }
    tryToLetTheClosureEscape(pred)
}
f(2 > 1)

/* AUTOCLOSURE implies the @noescape attribute so if you want the closure to escape you have to
use @autoclosure(escaping) form of the attribute */

func tryToLetTheAutoClosureEscape(@noescape fleeingClosure: () -> Bool) {
    //    closureVariable = fleeingClosure
}


///So it works with just an expression without the need to wrap it in a closure.






























/* ENUMERATIONS 

Use the dictionary example of the DictionaryJSON playground and expand it using enums,
like this article goes through. 
http://www.atimi.com/simple-json-parsing-swift-2/

See happySky app too
*/

/*
Defines a common type for a group of related values and allow you to work with these values
in a type safe manner within your code.

*** They don't need to be assigned a value for each case 
*** If a value (raw value) is provided for ea enum case, it can be a string, character, integer
or floating-point type.


*/

//: Playground - noun: a place where people can play

import Cocoa

// Enum syntax
enum Compass {
    case North // enumeration definition goes here
    case South
    case East
    case West
}

// Multiple case can appear as a single line (separated by commas)
// Give enum definitions a capital letter and should be singular not plural

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// Type inference, therefore can set it to another enum value with dot syntax
var directionToHead = Compass.West

directionToHead = .East

// Matching enum values using switch

directionToHead = .South
switch directionToHead {
case .North:
    print("Heard its cold up there")
case .South:
    print("Watch out for penguins")
case .East:
    print("To sunrise")
case .West:
    print("To sunset")
}



// ASSOCIATED VALUES 
/*
    allow you to attach data to instances of an enum and different 
    cases can hv different types of associated values. Useful to store asso'd values
    along with case value and permits the info to vary each time you use that case in 
    your code. 
*/


enum ShapeDimension {
    case Point
    case Square (Double)
    case Rectangle(width: Double, height: Double)
    case RightTriangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
            // a = (ab)/2
        case let .RightTriangle(width: w, height: h):
            return (w * h) / 2
        }
    }
    // this func = a method, a method is a func that is asso'd with a type (enum or class)
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return (w * 2) + (h * 2)
            // sqroot( h^2 + w^2) + h + w
        case let .RightTriangle(width: w, height: h):
            return sqrt((h*h) + (w*w)) + w + h
        }
    }
}



var squareShape = ShapeDimensions.Square(10.0)
var triangleShape = ShapeDimensions.RightTriangle(width: 5, height: 10)
print(squareShape.area())
print(triangleShape.perimeter())


// *********** STOP HERE ***************

// RAW VALUES
/*
    can prepoluate with default values (or 'raw' values) which are all the 
same type. 
    Raw values  1.) MUST be unique w/in enum declaration
                2.) Can be string, char, int, or float-pt num types
*/

enum ASCIIControlChar: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


// IMPLICITLY ASSIGNED RAW VALUES
/*
    don't hv to explicitly assign raw value for ea case, but once one is assigned
    Swift is smart enough to catch on
*/

enum PlanetList: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// When strings are used for the values, Swift defaults to using the case name as the raw value

enum CompassNew: String {
    case North, South, East, West
}


// ACCESSING THE RAW VALUE
let direction = CompassNew.South.rawValue
let venusOrder = PlanetList.Venus.rawValue



// Example

enum Direction {
    case Up
    case Down
    case Left
    case Right
}

var location = (x: 0, y:0)

var steps: [Direction] = [.Up, .Up, .Up, .Left, .Down, .Right, .Left]
print(steps[0])



for step in steps {
    switch step {
    case .Up:
        location.y += 1
    case .Down:
        location.y -= 1
    case .Left:
        location.x -= 1
    case .Right:
        location.x += 1
    }
}

location


// Rock, paper, scissors, lizard, Spock

enum HandShape {
    case Rock
    case Paper
    case Scissors
    case Lizard
    case Spock
}

// Define enum for result

enum Result: String {
    case Win, Lost, Draw
}

func match (firstPlayer a: HandShape, secondPlayer b: HandShape) -> Result {
    
    if   a == .Spock && (b == .Scissors || b == .Rock)      ||
        (a == .Rock && (b == .Lizard || b == .Scissors))    ||
        (a == .Paper && (b == .Spock || b == .Rock))        ||
        (a == .Scissors && (b == .Lizard || b == .Paper))   ||
        (a == .Lizard && (b == .Spock || b == .Paper))      {
        return .Win
    } else if a == b {
        return .Draw
    } else {
        return .Lost
    }
    
}

match(firstPlayer: .Rock, secondPlayer: .Spock)

// *********** STOP HERE ***************

// INITIALIZING FROM A RAW VALUE
/*
    If defining enum w/ raw-value type, enum automatically receives initializer that 
    takes a value of the raw values type (as a parameter "raw value") and returns either 
    an enumeration or nil.

    Can use this initializer to try to create a new instance of the enum.
*/

// Example: Id'ing Uranus from its raw value 7

let possiblePlanet = PlanetList(rawValue: 7)

// But not every int value will find a match (enum case) -> failable initializer 
// So use optional binding to test if there is a match

let positionToFind = 11
if let somePlanet = PlanetList(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Safe for humans")
    default:
        print("Not safe for humans")
    }
} else {
    print("There is not a planet at position: \(positionToFind)")
}

//RECURSIVE ENUMERATIONS 
/*
	is an enum that has another instance of the enum as the assoc'd value for one or more
	of the enum cases. The compiler has to insert a layer of indirection when it works with 
	recursive enums therefore use the keyword "indirect" before the case or at the 
	beginning of the enum
	*/  

enum MathematicalExpression {
    case Number(Int)
    indirect case Add(MathematicalExpression, MathematicalExpression)
    indirect case Subtract(MathematicalExpression, MathematicalExpression)
    indirect case Multiply(MathematicalExpression, MathematicalExpression)
    indirect case Divid(MathematicalExpression, MathematicalExpression)
}

/*
indirect enum MathematicalExpression {
    case Number(Int)
    case Add(MathematicalExpression, MathematicalExpression)
    ...
}

*/
func evaluate (expression: MathematicalExpression) -> Int {
    switch expression {
    case .Number(let value):
            return value
    case .Add(let left, let right):
            return evaluate(left) + evaluate(right)
    case .Subtract(let left, let right):
            return evaluate(left) - evaluate(right)
    case .Multiply(let left, let right):
            return evaluate(left) * evaluate(right)
    case .Divid(let left, let right):
            return evaluate(left) / evaluate(right)
    }
}

// evaluate (6+2) * 5

let six = MathematicalExpression.Number(6)
let two = MathematicalExpression.Number(2)
let sum = MathematicalExpression.Add(six, two)
let product = MathematicalExpression.Multiply(sum, MathematicalExpression.Number(5))
print(evaluate(product))

/*
indirect enum MathematicalExpression {
    case Number(Int)
    case Add(MathematicalExpression, MathematicalExpression)
    case Subtract(MathematicalExpression, MathematicalExpression)
    case Multiply(MathematicalExpression, MathematicalExpression)
    case Divid(MathematicalExpression, MathematicalExpression)
}

*/


























































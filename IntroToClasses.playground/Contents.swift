
import Foundation
import SpriteKit

/* CLASSES

OBJECT & INSTANCES

PROPERTIES (varible &/or constant) & METHODS (function)

*/



// SYNTAX

class SomeClass { // Pascal
    // some properties &/or methods go here
}

// CREATe OUR VERY FIRST CLASS
class Shape {  // = base class
    // PROPERTIES => attributes, variables/constants can be stored or computed properties
    var name: String
    var width: CGFloat = 20.0
    var color: NSColor
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    // Computed properties
    var point: String {
        // getter = read-only
        get {
            return "(\(x), \(y))"
        }
    }
    
    var area: CGFloat {
        get {
            return width * width
        }
        // Setter
        set (newWidth) {
            self.width = newWidth / 2
        }
    }
    
    /* INITIALIZATION - Initialization is a step in the lifetime of an instance of a class or structure.
    During initialization, we prepare the instance for use by populating its properties with initial
    values. The initialization of an instance can be customized by implementing an initializer,
    a special type of method. */
    
    init (name: String, width: CGFloat, color: NSColor) {
        self.name = name // self refers to the specified property of the instance
        self.width = width
        self.color = color
    }
    
    /* METHODS - Add behaviour or functionality (looks like a function)*/
    func calculatePerimeter() -> CGFloat {
        return 4 * width
    }
    
}


/* INSTANTIATION - Instantiating an instance of a class is very similar to invoking a function.
To create an instance, the name of the class is followed by a pair of parentheses, the return
value is assigned to a constant or variable. */

/************** OLD SWIFT 2 CODE *********************/
//var greenSquare = Shape(name: "Green Square", width: 200, color: NSColor.greenColor())
//var blueSquare = Shape(name: "Blue Square", width: 100, color: NSColor.blueColor())
//var cyanSquare = Shape(name: "Cyan Square", width: 50, color: NSColor.cyanColor())

/************** NEW AND IMPROVED SWIFT 3 CODE *********************/
var greenSquare = Shape(name: "Green Square", width: 200, color: NSColor.green)
var blueSquare = Shape(name: "Blue Square", width: 100, color: NSColor.blue)
var cyanSquare = Shape(name: "Cyan Square", width: 50, color: NSColor.cyan)

//Access the properties of an instance using the convenience of the dot syntax.

greenSquare.point
greenSquare.area
greenSquare.area = 100000
greenSquare.width

blueSquare.calculatePerimeter()
blueSquare.x = 3
blueSquare.y = 2


// Let draw a shape using our new square
var greenSquareStructure = CGRect(x: greenSquare.x, y: greenSquare.y, width: greenSquare.width, height: greenSquare.width)


var blueSquareStructure = CGRect(x: blueSquare.x, y: blueSquare.y, width: blueSquare.width, height: blueSquare.width)

var blueSquareLive = SKShapeNode(rect: blueSquareStructure)

blueSquareLive.fillColor = blueSquare.color


// SUBCLASSES - Act of basing a new off of an existing class, 
// INHERITANCE is a fundamental behavior that differentiates classes from other types (like structures) in Swift.

// Subclass syntax
class SomeSubclass: SomeClass {
    // properties, methods...
}

class Circle: Shape {
    
    // A new variable - to use later
    // Lazy - stored property whose initial value isn't calculated until it's first used
    lazy var radius: CGFloat = self.width / 2
    
    // OVERRIDING
    
    // Override a computed property
    override var area: CGFloat {
        get {
            return CGFloat(M_2_PI) * (radius * radius) // pi * r^2
        }
        // Setter
        set (newWidth) {
            self.width = 2 * sqrt(newWidth / CGFloat(M_2_PI))
        }
    }

    // Override a method
    override func calculatePerimeter() -> CGFloat {
        return 2 * CGFloat(M_2_PI) * radius
    }

    
    // Extending subclass with custom methods:
    func createShape() -> SKShapeNode {
        return SKShapeNode(circleOfRadius: self.radius)
    }
    
    func addFillColor () -> NSColor {
        return self.color
    }
}

/************** OLD SWIFT 2 CODE *********************/
//var redCircle = Circle(name: "Red Circle", width: 200, color: NSColor.redColor())

/************** NEW AND IMPROVED SWIFT 3 CODE *********************/
var redCircle = Circle(name: "Red Circle", width: 200, color: NSColor.red)

redCircle.radius
redCircle.calculatePerimeter()

var redCircleDisplay = redCircle.createShape()
redCircleDisplay.fillColor = redCircle.addFillColor()

// You can override a property

// Create a new subclass - ellipse




















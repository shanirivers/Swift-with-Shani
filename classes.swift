/* CLASSES
 
Objects and Instances
A class is a blueprint or template for an instance of that class. The term object is often 
used to refer to an instance of a class. In Swift, however, classes and structures are very 
similar and it's therefore easier and less confusing to use the term instance for both 
classes and structures.
 
Methods and Functions
Earlier in this series, we worked with functions. In the context of classes and 
structures, we usually refer to functions as methods. In other words, 
methods are functions that belong to a particular class or structure. 
In the context of classes and structures, you can use both terms interchangeably 
since every method is a function.

References: 
http://img05.deviantart.net/b12a/i/2012/366/0/7/sora_s_segway_by_yoi_kun-d5pxaq3.png
 
*/
 
// SYNTAX
class Person {
                // Enter code here to define class Person
}
 
// PROPERTIES = attributes, variables/constants can be stored or computed properties
class Person {
                //NOTE: Stored properties need to have a value after initialization 
                //or be defined as an optional type
    var firstName: String?
    var lastName: String?
                // Constant property can possibly change its value during the 
                //initialization of an instance. Once instance has been initialized, 
                //the property can no longer be modified
    let gender = "female"
}
 
// Methods - Add behaviour or functionality (looks like a function)
class Person {
    var firstName: String?
    var lastName: String?
    let gender = "female"
    
    func fullName() -> String {
        var parts: [String] = []
        
        if let firstName = self.firstName {
            parts += [firstName]
        }
        
        if let lastName = self.lastName {
            parts += [lastName]
        }
        
        return " ".join(parts)
    }
}
 
/* INSTANTIATION - Instantiating an instance of a class is very similar to invoking a function. 
To create an instance, the name of the class is followed by a pair of parentheses, the return 
value is assigned to a constant or variable. */
 
let john = Person()
 
// We can access the properties of an instance using the convenience of the dot syntax.
 
john.firstName = "John"
john.lastName = "Doe"
john.gender = "male" // Assigning "male" to the gender property, however, results in an error.
 
/* INITIALIZATION - Initialization is a step in the lifetime of an instance of a class or structure. 
During initialization, we prepare the instance for use by populating its properties with initial 
values. The initialization of an instance can be customized by implementing an initializer, 
a special type of method. */
 
class Person {
    var firstName: String?
    var lastName: String?
    let gender = "female"
    
    init() {
        self.gender = "male" //  self refers to the instance that's being initialized. 
        //This means that self.gender refers to the gender property of the instance.
    }
}
 
 
// ***********************  MY OWN NOTES ****************************************



import Foundation
import SpriteKit

/* CLASSES 

OBJECT & INSTANCES

PROPERTIES & METHODS

*/

// SYNTAX

class SomeClass {
    // some properties &/or methods go here
}

// PROPERTIES => attributes, variables/constants can be stored or computed properties

class Shape {
    var name: String = "Square"
    var width: Int
    var color: NSColor // Change this to an optional
    var x: Int = 0
    var y: Int = 0
    
    /* INITIALIZATION - Initialization is a step in the lifetime of an instance of a class or structure.
    During initialization, we prepare the instance for use by populating its properties with initial
    values. The initialization of an instance can be customized by implementing an initializer,
    a special type of method. */
    init (width:Int, color: NSColor) {
        self.width = width
        self.color = color //  self refers to the instance that's being initialized.
        //This means that self.color refers to the color property of the instance.
    }
  // Computed propety read and write ability, getter & a setter
 
    var area: Int {
        get {
            return width * width
        }
        
        set {
            self.width = newValue / 2  // newValue is a default convention provided by Swift 
            //if you didn't specify a name for the value coming in
        }
    }
    
      // Computed properties - read-only with just a get, must use var  to declare computed properties
    var point: String {
        get {
            return "(\(x), \(y))"
        }
    }
    
     /* METHODS - Add behaviour or functionality (looks like a function)*/
    func calculatePerimeter() -> Int {
        return 4 * width
    }
}

/* INSTANTIATION - Instantiating an instance of a class is very similar to invoking a function.
To create an instance, the name of the class is followed by a pair of parentheses, the return
    value is assigned to a co
    nstant or variable. */
var greenSquare = Shape(width: 200, color: NSColor.greenColor())


//Access the properties of an instance using the convenience of the dot syntax.
greenSquare.name = "Green Square"

// Let draw a shape using our new square
var greenSquareStructure = CGRect(x: greenSqua.x, y: greenSquare.y, width: greenSquare.width, 
height: greenSquare.width)

var greenSquareVisible = SKShapeNode(rect: greenSquareStructure)

greenSquareVisible.fillColor = greenSquare.color



// SUBCLASSES - Act of basing a new off of an existing class, inheritance

// Subclass syntax
/*

class SomeSubclass: SomeBaseClass {
    // some properties, method...
}

*/

class Circle: Shape {
    
    // A new variable - to use later
    /*  LAZY: lazy stored property is a property whose initial value is not calculated until 
    the first time it is used */
    lazy var radius: CGFloat = self.width / 2
    
    // OVERRIDING - MUST always state both the name and  type of the property you are overriding,  enables
    // compiler to check that your override matches a superclass property with the same name and 
    type.
    
    // Override a computed property
    override var area: CGFloat {
        get {
            return CGFloat(M_2_PI) * (radius * radius)
        }
        
        set {
            self.radius = sqrt(newValue / CGFloat(M_2_PI))  
            // newValue is a default convention provided by Swift
            //if you didn't specify a name for the value coming in
        }
    }
    
    // Override a method
    override func calculatePerimeter() -> CGFloat 
        return 2 * CGFloat(M_2_PI) * radius
    }
    
    
    // Extending subclass with custom methods:
    func createShape () -> SKShapeNode {
        return SKShapeNode(circleOfRadius: self.radius)
    }
    
    func addFillColor () -> NSColor {
        return self.color
    }
    
}

// Create instance of circle class

var redCircle = Circle(name: "Red Circle", width: 200, color: NSColor.redColor())

redCircle.addFillColor()

var redCircleDisplay = redCircle.createShape()
redCircleDisplay.fillColor = redCircle.addFillColor()

 




 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
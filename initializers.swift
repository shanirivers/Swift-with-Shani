//: Playground - noun: a place where people can play

import UIKit

/*  "4" RULES OF INITIALIZERS
 1.  DI's in subclasses MUST call DIs from superclasses
 * DIs ALWAYS delegate UPward to other DIs and NEVER CIs
 
 2.  CIs MUST call other initializers (DIs or CIs) defined in the SAME class.
 * CIs always delegate sideways and may NOT walk up the chain to a superclass

 3.  CIs MUST end up redirecting to a DI in the same class and it must do so by calling a DI
 declared in the same class as itself

 4.  Any class that inherits OR overrides its superclass MAY inherit its convenience initializers
 
 */


/* DESIGNATED INITIALIZERS - responsible for initializing all properties in class AND require
 all values to be sent in for each property */
class RootClass {
    var a : Int // Local storage for property a
    
    //     Designated initializer
    init(a: Int) {
        self.a = a // initialization for a
    }
}


// CREATE AN INSTANCE
var newInstance = RootClass(a: 4)
print(newInstance.a)



// ANOTHER EXAMPLE

class Person {
    let name: String
    let age: Int
    
    init (name: String, age: Int){ // DESIGNATED INITIALIZER
        self.name = name
        self.age = age
    }
    
    /* CONVENIENCE INITIALIZER - provides secondary construction utility, or just helps out
      with a value that doesn't require manual input e.g. timestamp ,enables it to piggyback
     on other DI's or to create defaults, 
     CIs must delegate to another CI or DIs - think train rails */
    convenience init (name: String) {
        self.init(name: name, age: 18)
    }
    
    convenience init(){
        self.init(name: "Cartman")
    }
}

// CREATE SOME INSTANCES
let aPerson = Person(name: "Dave", age: 30)
print("Here's \(aPerson.name), who's \(aPerson.age) years old")

let aPersonWithDefaultAge = Person(name: "Sue")

print("Here's \(aPersonWithDefaultAge.name), who's \(aPersonWithDefaultAge.age) years old by default")

let defaultPerson = Person()
print("Here's the default clone of a person, \(defaultPerson.name), who's \(defaultPerson.age) years old by default")


/* SUBCLASS - the subclass' DI sets its new properties 1st and then its superclass' DI in their
 immediate parent class */
class ChildClass: RootClass {
    var b : String
    
    init(a: Int, b: String) {   // DESIGNATED INITIALIZER
        self.b = b              // initialize own property first
        
        // Need to call super init to bring in the properties from the superclass
        
        super.init(a:a)         /* initialize superclass 2nd, DI walks UP the superclass ladder
                                    super.init redirects to superclass */
    }
    
    /* CI's delegate across like train rails and always end at some point to a DI in same class
     DI's of subclasses MUST call other DI's of their superclass therefore if you try to call the CI
     of the superclass = compile error*/
    
    convenience override init(a: Int) {  // OVERRIDE using a CI
        self.init(a:a, b:"red")
    }
}

var newChildInstance = ChildClass(a: 5, b: "blue")
var newChildInstanceConv = ChildClass(a: 6)
print(newChildInstance.b)
print(newChildInstance.a)

print(newChildInstanceConv.b)
print(newChildInstanceConv.a)


// ANOTHER SUBCLASS EXAMPLE

class Student: Person {
    let studentId: String
    
    init(studentId: String, name: String, age: Int){
        self.studentId = studentId
        super.init(name:name, age:age)
        // Note that the CI's from the superclass don't carry over if no override CI used,
        // test this out by omitting name or age at instantiation, before adding the CI below
    }
    
    // OVERRIDE using a CI, will inherit CI's of the superclass
    convenience override init(name:String, age:Int) {
        self.init(studentId: "001a", name: name, age: age)
    }
}

let aStudent = Student(studentId: "123a", name: "Bob", age: 20)
print("Here's \(aStudent.name), who's \(aStudent.age) years old with student id #\(aStudent.studentId)")

let StudentB = Student( name: "Bob")
print("Here's \(StudentB.name), who's \(StudentB.age) years old (CI from superclass carries over) with default student id #\(StudentB.studentId)")




/*  Subclasses inherit DI's & CI's if they don't add new variables that need
	initialization this applies to classes that don't define add'l stored properties and classes
 whose new properties are default values defined ouside initializers E.G. var x: Int = 5 */

class Employee: Person {
    var company: String = "Apple Inc"
}

var anEmployee = Employee()
print("\(anEmployee.name) is an employee of \(anEmployee.company).")











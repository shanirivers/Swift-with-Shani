// Dictionaries

// API example references: https://roadfiresoftware.com/2015/10/how-to-parse-json-with-swift-2/

/*  COLLECTIONS TYPES:  ** Collections are mutable, therefore can's use constants
    1. Array  
    2. Dictionary *** stores associations btw keys of some types and values of some type
    				  in a collection with no defined ordering, you look up values by
    				  their identifier or key (like a real-life dictionary)
    3. Set
*/

// SYNTAX: Dictionary <key, value>

// the key MUST BE HASHABLE (searchable) - meaning that it has to be 
// (Bool, Int, Double, String)

// ALL BASIC TYPES ARE HASHABLE



// DICTIONARY LITERALS  - key value pairs are separated by colon :

// long-hand:

                      //<KeyType, ValueType>
var airports: Dictionary <String, String> = ["SEA": "Seattle", "HNL": "Honolulu"]

airports = ["TYO":"Tokyo", "PDX": "Portland"]

//short-hand: 

var nameByParkingSpace: [Int : String]

nameByParkingSpace = [13: "Allison", 15: "Mike"]



//ACCESSING & MODIFYING

// count

airports.count

// isEmpty

airports.isEmpty // <- this is another way to check if a dictionary is empty

// adding new item with subscripting

airports["LHR"] = "London"

// to change a value can use updateValue(_:forKey)

airports.updateValue("Dublin", forKey: "DUB") //returns an optional, use subscripting to retrieve value

if let airportName = airports["DUB"] {
    print("\(airportName)")
} else {
    print("No name")
}

// REMOVE KEY, VALUE PAIR 

// by subscripting and setting the value to nil

airports["APL"] = "Apple Intn"

airports["APL"] = nil

airports["APL"]

// by using removeValueForKey(_:)
airports.removeValueForKey("DUB")



// INTERATING OVER A DICTIONARY

// for-in

for (airportCode, airportName) in airports {
    print("\(airportCode) : \(airportName)")
}

// interate by accessing key & value properties

for airportCode in airports.keys {
    print("Airport code is \(airportCode)")
}

for airportName in airports.values {
    print("Airport name is \(airportName)")
}

// To use dict keys or values with in an API (application program interface)
// that takes an array instance, 
// initialize a new array with keys or values

/* JavaScript Object Notation = JSON for short, is a common way to transmit data to and 
from web services. It is simple to use and human-readable, 
which is why it’s so incredibly popular. */


let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// Using optionals to check the existence of a value in a dictionary 

let users = ["bSmith":"Bob Smith", "sJobs": "Steve Jobs"]

let steve : String? = users["sJobs"]

if let user = steve { // if steve is not nil
    print("\(user) is in the dictionary")
}


// My own example: using gravity of other planets
/*
http://www.livescience.com/33356-weight-on-planets-mars-moon.html
Weight is the force gravity exerts on an object due to its mass. Mass,
roughly, measures an object's inertia, 
its resistance to being moved or stopped, once it's in motion.


Written as a formula, Newton's gravitation law looks something like this:

F = G((Mm)/r2)

Where

F is the gravitational force between two objects,
G is the Gravitational Constant (6.674×10-11 Newtons x meters2 / kilograms2),
M is the planet's mass (kg),
m is your mass (kg), and
r is the distance (m) between the centers of the two masses (the planet's radius).

*/

/*
To calculate the ratio between Earth's surface gravity and that of any other
 celestial body, you must compute them separately using the formula above, and 
 then divide the desired planet's gravitational force by Earth's. We will spare you 
 the work:

Mercury:  0.38
Venus:  0.91
Earth:  1.00
Mars:  0.38
Jupiter:  2.34
Saturn:  1.06
Uranus:  0.92
Neptune:  1.19
Pluto:  0.06*/



// To use dict keys or values with in an API (application programming interface)
// that takes an array instance, 
// initialize a new array with keys or values

/* JavaScript Object Notation = JSON for short, is a common way to transmit data to and 
from web services. It is simple to use and human-readable, 
which is why it’s so incredibly popular. */

let airQuality: NSURL = [#FileReference(fileReferenceLiteral: "airquality.json")#]
let data = NSData(contentsOfURL: airQuality)!

do {
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
    
    if let airRecommendation = json["random_recommendations"] as? [String:AnyObject] {
        if let children = airRecommendation["children"] as? String {
            print("\(children)")
        }
    }
    
    if let pollutantDescription = (json as! NSDictionary)["dominant_pollutant_description"] as? String {
        print(pollutantDescription)
    }
    
    if let pollutantText = (json as! NSDictionary)["dominant_pollutant_text"] {
        print(pollutantText)
        if let effects = pollutantText["effects"] as? String {
            print(effects)
        }
    }
    
} catch {
    print("error serializing JSON: \(error)")
}


d65e7205c2804d798d581d498e5855b5
















































//: Playground - noun: a place where people can play

import Foundation

/*  
    TYPECASTING - way to check type of an instance or treat that instanace as a different super/sub class
 
 */


// is & as  operators - provide simple way to check type OR cast a value to a different type

//:  EXAMPLE - Superclass with a couple of subclasses

class Vehicle {
    var fuelType: String
    var wheelNumber: Int
    var brand: String
    
    init(fuelType: String, wheelNumber: Int, brand: String) {
        self.fuelType = fuelType
        self.wheelNumber = wheelNumber
        self.brand = brand
    }
}

class Car: Vehicle {
    var model: String
    
    init(fuelType: String, wheelNumber: Int, brand: String, model: String) {
        self.model = model
        super.init(fuelType: fuelType, wheelNumber: wheelNumber, brand: brand)
    }
}

class Bicycle: Vehicle {
    var gearNumber: Int
    
    init(fuelType: String, wheelNumber: Int, brand: String, gearNumber: Int) {
        self.gearNumber = gearNumber
        super.init(fuelType: fuelType, wheelNumber: wheelNumber, brand: brand)
    }
}


//: Create an array to hold a few instances 

var garage = [Bicycle(fuelType: "none", wheelNumber: 2, brand: "Trek", gearNumber: 1),
              Car(fuelType: "Electricity", wheelNumber: 4, brand: "Tesla", model: "Model S"),
              Bicycle(fuelType: "none", wheelNumber: 2, brand: "Scott", gearNumber: 10),
              Car(fuelType: "Biodeisel", wheelNumber: 4, brand: "VW", model: "Golf"),
              Car(fuelType: "Gasoline", wheelNumber: 3, brand: "Elio", model: "")]




//: EXAMPLE: Use type check operator, is

var bikeCount = 0
var carCount = 0

for vehicle in garage {
    if vehicle is Car {
        carCount += 1
    } else if vehicle is Bicycle {
        bikeCount += 1
    }
}

print("My garage contains \(carCount) cars and \(bikeCount) bikes.")


// Downcasting - constant/variable of certain class maybe or refer to an instance behind the scenes & if this is the case you can downcast to the subclass type using typecast operator "as" - 

// 1. as? -> optional
// 2. as! -> force unwrap



// 1. as? -> optional. EXAMPLE: Using the as? (or conditional form which returns an optional)

for vehicle in garage {
    if let car = vehicle as? Car {
        print("My \(car.brand) uses \(car.fuelType) as fuel and has \(car.wheelNumber) wheels.")
    } else if let bike = vehicle as? Bicycle {
        if bike.gearNumber == 1 {
            print("My \(bike.brand) is a fixie, which has only \(bike.gearNumber) gear.")
        } else {
            print("My \(bike.brand) is a \(bike.gearNumber) speed.")
        }
    }
}


// 2. as! -> force unwrap

// EXAMPLE: Force unwrapping data that I believe is JSON and CASTING it to a dictionary using as!

// Pull data in from our json file, to work with weather data go to https://darksky.net
// To make json easier to read, http://jsonprettyprint.com

let fileURL = Bundle.main.url(forResource: "weather", withExtension: "json")
let weatherForecastData = NSData(contentsOf: fileURL!)

// Going to do this with error-catching by using a do-catch block, because force unwrapping can throw an error

do {
    let json = try JSONSerialization.jsonObject(with: weatherForecastData as! Data, options: JSONSerialization.ReadingOptions.allowFragments)
    
    // Force unwrap and typecast to a dictionary as String
    if let timezone = (json as! NSDictionary)["timezone"] as? String {
        print(timezone)
    }
    
    // AnyObject & Any
    if let hourlyForecast = (json as! NSDictionary)["hourly"] as? [String: AnyObject] {
        if let dailySummary = hourlyForecast["summary"] as? String {
            print(dailySummary)
        }
    }
    
    var currentlySummary: String {
        guard let current = (json as! NSDictionary)["currently"] as? [String: AnyObject],
            let forSummary = current["summary"] as? String else {
                return "error"
        }
        return forSummary
    }
    print(currentlySummary)
    
} catch {
   print("There was an error serializing JSON: \(error)")
}







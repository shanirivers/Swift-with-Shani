//: Playground - noun: a place where people can play

import SpriteKit
import XCPlayground

/* SUBCLASSING SYNTAX: Subclassing is the act of basing a new class on an existing class. 
The subclass inherits characteristics from the existing class, 
which you can then refine. You can also add new characteristics to the subclass. */

class SomeSubclass: SomeSuperclass {
 	// subclass definition goes here
}


// Create the Spritekit View 
let frame = CGRect(x: 0, y: 0, width: 1024, height: 584)

// Set middle point
let midPoint = CGPoint(x: frame.size.width/2, y: frame.size.height/2)

// Set the scene
var scene = SKScene(size: frame.size)

// Add distant stars or galaxies

let emitter = SKEmitterNode()
emitter.particleLifetime = 40
emitter.particleBlendMode = SKBlendMode.Alpha
emitter.particleBirthRate = 5
emitter.particleSize = CGSize(width: 3,height: 3)
emitter.particleColor = SKColor.whiteColor()//(red: 100, green: 100, blue: 255, alpha: 1)
emitter.position = CGPoint(x:frame.size.width,y:midPoint.y)
emitter.particleSpeed = 16
emitter.particleSpeedRange = 100
emitter.particlePositionRange = CGVector(dx: 0, dy: frame.size.height)
emitter.emissionAngle = 3.14
emitter.advanceSimulationTime(40)
emitter.particleAlpha = 0.5
emitter.particleAlphaRange = 0.5
scene.addChild(emitter)



// CREATE CELESTIAL BODY SUBCLASS 
class Body: SKSpriteNode { /* Inheritance: When one class inherits from another, the inheriting 
class is known as a subclass , and the class it inherits from is known as its superclass . 
Inheritance is a fundamental behavior that differentiates classes from other types in Swift*/
    
    // Spawn
    func spawn (parentNode: SKNode, position: CGPoint, size: CGSize = CGSizeMake(100, 100), color: NSColor) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.color = color
    }
    
    // Set rotation animation
    func rotateAnimation (angle: CGFloat, duration: NSTimeInterval) {
        self.runAction(SKAction.repeatActionForever(SKAction.rotateByAngle(angle, duration: duration)))
    }
    
}

// SPAWN SUN AND FIRST PLANET
let sun = Body()
let mercury = Body()
let venus = Body()
let venusMoon = Body()

sun.spawn(scene, position: midPoint, color: NSColor.yellowColor())
sun.rotateAnimation(1.2, duration: 1)

mercury.spawn(sun, position: CGPoint(x: frame.size.width/8, y: frame.size.height/8 ), size: CGSize(width: 50, height: 50), color: NSColor.redColor())

venus.spawn(sun, position: CGPoint(x: 200, y: -200 ), size: CGSize(width: 50, height: 50), color: NSColor.orangeColor())
venus.rotateAnimation(1.2, duration: 2)

venusMoon.spawn(venus, position: CGPoint(x: 50, y: 50 ), size: CGSize(width: 10, height: 10), color: NSColor.grayColor())

// 
// Create a sprite
let square: SKSpriteNode = SKSpriteNode(color: NSColor.purpleColor(), size: CGSizeMake(100, 100))

// Set position of sprite
let middleOfScenePoint = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
square.position = middleOfScenePoint  // can specify point if you want with CGPoint(x: 3, y: 100)

// Have the sprite do an action
square.runAction(SKAction.repeatActionForever(SKAction.rotateByAngle(6, duration: 3)))


// Show scene and present it
let view = SKView(frame: frame)
view.presentScene(scene)

// Show this in the assistant editor
XCPlaygroundPage.currentPage.liveView = view


/* --------------------------------------------------------------------------------- */
// CREATE CELESTIAL BODY CLASS - FINAL CUT ****************************************
class Body: SKSpriteNode {


    // Spawn
    func spawn ( parentNode: SKNode, texture: SKTexture, position: CGPoint, size: CGSize = CGSizeMake(100, 100)) {
        
        parentNode.addChild(self)
        self.texture = texture
        self.size = size
        self.position = position
     
    }
    
    // Set rotation animation
    func rotateAnimation (angle: CGFloat, duration: NSTimeInterval) {
        self.runAction(SKAction.repeatActionForever(SKAction.rotateByAngle(angle, duration: duration)))
    }
    
}

// SPAWN SUN AND FIRST PLANET
let sun = Body()
let mercury = Body()
let venus = Body()
let venusMoon = Body()


// SUN
sun.spawn(scene, texture:  SKTexture(imageNamed: "sun-hd.png"),position: midPoint,  size: CGSize(width: 100, height: 100))
sun.rotateAnimation(1.2, duration: 1)

// MERCURY
mercury.spawn(sun, texture: SKTexture(imageNamed: "mercury.png"), position: CGPoint(x: frame.size.width/10, y: frame.size.height/10 ), size: CGSize(width: 30, height: 30))

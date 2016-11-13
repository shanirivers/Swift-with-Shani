// TDD In Swift Playgrounds - forked from sshrpe and modified by Shani https://github.com/shanirivers/TDDSwiftPlayground
// Practice with Katas  http://agilekatas.co.uk/katas

// First: make sure you import XCTest:

import XCTest



// TYPE IMPLEMENTATION CODE HERE:









// TEST GO HERE:

class MyTests : XCTestCase {
    func testShouldFail() {
        XCTFail("You must fail to succeed!")
    }
    func testShouldPass() {
        XCTAssertEqual(2 + 2, 4)
    }
}

class MyOtherTest: XCTestCase {
    
}

// **************** BOILERPLATE CODE FOR RUNNING TESTS TO OUTPUT IN COMMAND LINE **************** //

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
    }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared()
center.addTestObserver(observer)


struct TestRunner {
    
    func runTests(testClass:AnyClass) {
        print("Running test suite \(testClass)")
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite()
        testSuite.run()
        let run = testSuite.testRun as! XCTestSuiteRun
        
        print("\n *** Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures ***\n")
    }
    
}
// **************** END OF BOILERPLATE CODE FOR RUNNING TESTS TO OUTPUT IN COMMAND LINE **************** //


// ENTER TEST CLASSES TO RUN HERE:

TestRunner().runTests(testClass: MyTests.self)
TestRunner().runTests(testClass: MyOtherTest.self)


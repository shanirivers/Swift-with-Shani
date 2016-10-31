import XCTest

// TYPE IMPLEMENTATION CODE HERE:





// TYPE TESTS HERE:
class MyExampleTests : XCTestCase {
    override func setUpExample() {
    }
    
    override func tearDownExample() {
    }
	
	func testingExample_ShouldBeTrue() {
		var myNumber = 3
		XCTAssertTrue(myNumber, 3)
	}
}


// **************** BOILERPLATE CODE FOR RUNNING TESTS TO OUTPUT IN COMMAND LINE **************** //
class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("\nTest failed on line \(lineNumber): \(testCase.name), \(description)\n")
    }
}

let playgroundObserver = PlaygroundTestObserver()
let testObservationCenter = XCTestObservationCenter.shared()
testObservationCenter.addTestObserver(playgroundObserver)


struct TestRunner {
    func runTests(testClass:AnyClass) {
        print("Running test suite \(testClass)\n")
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite()
        testSuite.run()
        let run = testSuite.testRun as! XCTestSuiteRun
        
        print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures\n")
    }
    
}
// **************** END OF BOILERPLATE CODE FOR RUNNING TESTS TO OUTPUT IN COMMAND LINE **************** //

// ENTER TEST CLASSES TO RUN HERE: 
TestRunner().runTests(testClass: MyExampleTests.self)

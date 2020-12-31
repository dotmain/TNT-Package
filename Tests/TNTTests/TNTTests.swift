import XCTest
@testable import TNT

final class TNTTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TNT().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

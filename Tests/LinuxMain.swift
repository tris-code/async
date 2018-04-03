import XCTest

import AsyncTests

var tests = [XCTestCaseEntry]()
tests += AsyncTests.__allTests()

XCTMain(tests)

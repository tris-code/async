import XCTest

extension AsyncDispatchTests {
    static let __allTests = [
        ("testTask", testTask),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AsyncDispatchTests.__allTests),
    ]
}
#endif

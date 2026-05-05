import Testing
@testable import SwiftLearning

@Suite("Day16: Equatable / Comparable / Hashable")
struct Day16Tests {

    // MARK: - 課題1: isEqual

    @Test("isEqual: Int")
    func testIsEqualInt() {
        #expect(isEqual(1, 1) == true)
        #expect(isEqual(0, 1) == false)
        #expect(isEqual(-5, -5) == true)
    }

    @Test("isEqual: String")
    func testIsEqualString() {
        #expect(isEqual("hello", "hello") == true)
        #expect(isEqual("abc", "ABC") == false)
        #expect(isEqual("", "") == true)
    }

    @Test("isEqual: Point")
    func testIsEqualPoint() {
        #expect(isEqual(Point16(x: 1, y: 2), Point16(x: 1, y: 2)) == true)
        #expect(isEqual(Point16(x: 1, y: 2), Point16(x: 1, y: 3)) == false)
    }

    // MARK: - 課題2: comparePoints

    @Test("comparePoints: less")
    func testComparePointsLess() {
        #expect(comparePoints(Point16(x: 1, y: 0), Point16(x: 2, y: 0)) == "less")
        #expect(comparePoints(Point16(x: 1, y: 2), Point16(x: 1, y: 5)) == "less")
    }

    @Test("comparePoints: equal")
    func testComparePointsEqual() {
        #expect(comparePoints(Point16(x: 3, y: 3), Point16(x: 3, y: 3)) == "equal")
        #expect(comparePoints(Point16(x: 0, y: 0), Point16(x: 0, y: 0)) == "equal")
    }

    @Test("comparePoints: greater")
    func testComparePointsGreater() {
        #expect(comparePoints(Point16(x: 5, y: 0), Point16(x: 2, y: 0)) == "greater")
        #expect(comparePoints(Point16(x: 1, y: 9), Point16(x: 1, y: 3)) == "greater")
    }

    // MARK: - 課題3: uniqueElements

    @Test("uniqueElements: Int")
    func testUniqueElementsInt() {
        let result = uniqueElements([1, 2, 1, 3, 2])
        #expect(Set(result) == Set([1, 2, 3]))
        #expect(result.count == 3)
    }

    @Test("uniqueElements: String")
    func testUniqueElementsString() {
        let result = uniqueElements(["a", "b", "a", "c"])
        #expect(Set(result) == Set(["a", "b", "c"]))
        #expect(result.count == 3)
    }

    @Test("uniqueElements: empty")
    func testUniqueElementsEmpty() {
        let result: [Int] = uniqueElements([])
        #expect(result.isEmpty)
    }

    @Test("uniqueElements: no duplicates")
    func testUniqueElementsNoDuplicates() {
        let result = uniqueElements([10, 20, 30])
        #expect(result.count == 3)
    }
}

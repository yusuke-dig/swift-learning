import Testing
@testable import SwiftLearning

@Suite("Day03: オプショナル")
struct Day03Tests {

    @Test("safeDivide: 通常の割り算")
    func testSafeDivideNormal() {
        #expect(safeDivide(10, 2) == 5.0)
        #expect(safeDivide(9, 3) == 3.0)
        #expect(safeDivide(1, 4) == 0.25)
    }

    @Test("safeDivide: ゼロ除算は nil")
    func testSafeDivideByZero() {
        #expect(safeDivide(10, 0) == nil)
        #expect(safeDivide(0, 0) == nil)
    }

    @Test("firstElement: 要素ありの配列")
    func testFirstElementNonEmpty() {
        #expect(firstElement([3, 1, 4]) == 3)
        #expect(firstElement([99]) == 99)
        #expect(firstElement([-1, 0, 1]) == -1)
    }

    @Test("firstElement: 空配列は nil")
    func testFirstElementEmpty() {
        #expect(firstElement([]) == nil)
    }

    @Test("parseAge: 正常な年齢文字列")
    func testParseAgeValid() {
        #expect(parseAge("25") == 25)
        #expect(parseAge("0") == 0)
        #expect(parseAge("120") == 120)
    }

    @Test("parseAge: 数値でない文字列は nil")
    func testParseAgeInvalidString() {
        #expect(parseAge("abc") == nil)
        #expect(parseAge("") == nil)
        #expect(parseAge("25.5") == nil)
    }

    @Test("parseAge: 範囲外の値は nil")
    func testParseAgeOutOfRange() {
        #expect(parseAge("121") == nil)
        #expect(parseAge("-1") == nil)
        #expect(parseAge("150") == nil)
    }
}

import Testing
@testable import SwiftLearning

@Suite("Day02: 基本型と型推論")
struct Day02Tests {

    @Test("celsiusToFahrenheit: 摂氏→華氏変換")
    func testCelsiusToFahrenheit() {
        #expect(celsiusToFahrenheit(0) == 32.0)
        #expect(celsiusToFahrenheit(100) == 212.0)
        #expect(celsiusToFahrenheit(-40) == -40.0)
        #expect(abs(celsiusToFahrenheit(37) - 98.6) < 0.01)
    }

    @Test("isLongWord: 6文字以上でtrue")
    func testIsLongWord() {
        #expect(isLongWord("swift") == false)   // 5文字
        #expect(isLongWord("kotlin") == true)   // 6文字
        #expect(isLongWord("programming") == true)
        #expect(isLongWord("") == false)
        #expect(isLongWord("hello!") == true)   // 6文字ちょうど
    }

    @Test("absolute: 絶対値")
    func testAbsolute() {
        #expect(absolute(5) == 5)
        #expect(absolute(-3) == 3)
        #expect(absolute(0) == 0)
        #expect(absolute(-100) == 100)
    }
}

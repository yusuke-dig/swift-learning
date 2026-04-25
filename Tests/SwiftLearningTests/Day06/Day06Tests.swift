import Testing
@testable import SwiftLearning

@Suite("Day06: 関数")
struct Day06Tests {

    @Test("repeat: countあり")
    func testRepeatWithCount() {
        #expect(repeatString(text: "Hi", count: 3) == "HiHiHi")
        #expect(repeatString(text: "ab", count: 1) == "ab")
        #expect(repeatString(text: "x",  count: 4) == "xxxx")
    }

    @Test("repeat: デフォルト count=2")
    func testRepeatDefault() {
        #expect(repeatString(text: "Go") == "GoGo")
        #expect(repeatString(text: "!") == "!!")
    }

    @Test("swap: 値が入れ替わる")
    func testSwap() {
        var a = 1, b = 2
        swapInts(&a, &b)
        #expect(a == 2)
        #expect(b == 1)
    }

    @Test("swap: 同じ値でも壊れない")
    func testSwapSame() {
        var a = 5, b = 5
        swapInts(&a, &b)
        #expect(a == 5)
        #expect(b == 5)
    }

    @Test("clamp: 範囲内はそのまま")
    func testClampInRange() {
        #expect(clamp(3, lower: 0, upper: 5) == 3)
        #expect(clamp(0, lower: 0, upper: 5) == 0)
        #expect(clamp(5, lower: 0, upper: 5) == 5)
    }

    @Test("clamp: 上限・下限を超えたとき")
    func testClampOutOfRange() {
        #expect(clamp(10, lower: 0, upper: 5) == 5)
        #expect(clamp(-3, lower: 0, upper: 5) == 0)
    }
}

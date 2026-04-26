import Testing
@testable import SwiftLearning

@Suite("Day07: クロージャ")
struct Day07Tests {

    @Test("applyTwice: 2回適用される")
    func testApplyTwice() {
        #expect(applyTwice(3)  { $0 * 2 }  == 12)
        #expect(applyTwice(1)  { $0 + 10 } == 21)
        #expect(applyTwice(10) { $0 - 3 }  == 4)
    }

    @Test("applyTwice: 恒等変換は変わらない")
    func testApplyTwiceIdentity() {
        #expect(applyTwice(5) { $0 } == 5)
    }

    @Test("myFilter: 偶数だけ")
    func testFilterEven() {
        #expect(myFilter([1, 2, 3, 4, 5]) { $0 % 2 == 0 } == [2, 4])
    }

    @Test("myFilter: 閾値より大きい")
    func testFilterGreater() {
        #expect(myFilter([10, 3, 7, 1]) { $0 > 5 } == [10, 7])
    }

    @Test("myFilter: 全て除外 / 全て通過")
    func testFilterEdge() {
        #expect(myFilter([1, 3, 5]) { $0 % 2 == 0 } == [])
        #expect(myFilter([2, 4, 6]) { $0 % 2 == 0 } == [2, 4, 6])
    }

    @Test("myMap: 二乗")
    func testMapSquare() {
        #expect(myMap([1, 2, 3]) { $0 * $0 } == [1, 4, 9])
    }

    @Test("myMap: 定数加算")
    func testMapAdd() {
        #expect(myMap([1, 2, 3]) { $0 + 10 } == [11, 12, 13])
    }

    @Test("myMap: 空配列")
    func testMapEmpty() {
        #expect(myMap([]) { $0 * 2 } == [])
    }
}

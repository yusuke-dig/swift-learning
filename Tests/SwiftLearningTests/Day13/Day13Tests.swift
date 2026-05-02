import Testing
@testable import SwiftLearning

@Suite("Day13: 高階関数")
struct Day13Tests {

    @Test("doubleAll: 全要素を2倍にする")
    func testDoubleAll() {
        #expect(doubleAll([1, 2, 3]) == [2, 4, 6])
        #expect(doubleAll([0, -1, 5]) == [0, -2, 10])
        #expect(doubleAll([]) == [])
    }

    @Test("onlyEven: 偶数だけ取り出す")
    func testOnlyEven() {
        #expect(onlyEven([1, 2, 3, 4, 5]) == [2, 4])
        #expect(onlyEven([1, 3, 5]) == [])
        #expect(onlyEven([2, 4, 6]) == [2, 4, 6])
        #expect(onlyEven([]) == [])
    }

    @Test("sumAll: 合計を返す")
    func testSumAll() {
        #expect(sumAll([1, 2, 3, 4, 5]) == 15)
        #expect(sumAll([]) == 0)
        #expect(sumAll([-1, 1]) == 0)
        #expect(sumAll([100]) == 100)
    }
}

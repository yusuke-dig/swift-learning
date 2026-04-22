import Testing
@testable import SwiftLearning

@Suite("Day04: コレクション")
struct Day04Tests {

    @Test("sum: 通常の配列")
    func testSumNormal() {
        #expect(sum([1, 2, 3, 4]) == 10)
        #expect(sum([10, 20, 30]) == 60)
        #expect(sum([-1, 1]) == 0)
    }

    @Test("sum: 空配列は 0")
    func testSumEmpty() {
        #expect(sum([]) == 0)
    }

    @Test("countOccurrences: 複数一致")
    func testCountOccurrencesMultiple() {
        #expect(countOccurrences([1, 2, 1, 3, 1], target: 1) == 3)
        #expect(countOccurrences([2, 2, 2], target: 2) == 3)
    }

    @Test("countOccurrences: 0件")
    func testCountOccurrencesZero() {
        #expect(countOccurrences([1, 2, 3], target: 9) == 0)
        #expect(countOccurrences([], target: 1) == 0)
    }

    @Test("mostFrequent: 最頻値あり")
    func testMostFrequentNormal() {
        #expect(mostFrequent([1, 2, 2, 3, 2]) == 2)
        #expect(mostFrequent([5, 5, 1]) == 5)
        #expect(mostFrequent([7]) == 7)
    }

    @Test("mostFrequent: 空配列は nil")
    func testMostFrequentEmpty() {
        #expect(mostFrequent([]) == nil)
    }
}

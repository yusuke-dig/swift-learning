import Testing
@testable import SwiftLearning

@Suite("Day22: Combine 入門")
struct Day22Tests {

    @Test("課題1: Just / Sequence から値を収集できる")
    func testCollectFromSequence() {
        let result = collectFromSequence()
        #expect(result == [1, 2, 3])
    }

    @Test("課題2: PassthroughSubject で値を送出できる")
    func testSendWithSubject() {
        let result = sendWithSubject()
        #expect(result == ["Hello", "Combine", "World"])
    }

    @Test("課題3: map + filter で値を変換・絞り込みできる")
    func testMapAndFilter() {
        // 1〜10 を2倍 → [2,4,6,8,10,12,14,16,18,20]
        // filter > 10 → [12,14,16,18,20]
        let result = mapAndFilter()
        #expect(result == [12, 14, 16, 18, 20])
    }
}

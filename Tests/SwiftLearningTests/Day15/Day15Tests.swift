import Testing
@testable import SwiftLearning

@Suite("Day15: 非同期処理")
struct Day15Tests {

    // ─────────────────────────────────────────
    // 課題1: fetchGreeting
    // ─────────────────────────────────────────
    @Test("fetchGreeting - 基本")
    func testFetchGreeting() async {
        let result = await fetchGreeting(name: "Alice")
        #expect(result == "Hello, Alice!")
    }

    @Test("fetchGreeting - 別の名前")
    func testFetchGreetingOtherName() async {
        #expect(await fetchGreeting(name: "Bob") == "Hello, Bob!")
        #expect(await fetchGreeting(name: "Swift") == "Hello, Swift!")
    }

    // ─────────────────────────────────────────
    // 課題2: fetchAll
    // ─────────────────────────────────────────
    @Test("fetchAll - 複数名前")
    func testFetchAll() async {
        let results = await fetchAll(names: ["Alice", "Bob", "Charlie"])
        #expect(results == ["Hello, Alice!", "Hello, Bob!", "Hello, Charlie!"])
    }

    @Test("fetchAll - 空配列")
    func testFetchAllEmpty() async {
        let results = await fetchAll(names: [])
        #expect(results.isEmpty)
    }

    @Test("fetchAll - 1件")
    func testFetchAllSingle() async {
        let results = await fetchAll(names: ["Swift"])
        #expect(results == ["Hello, Swift!"])
    }

    // ─────────────────────────────────────────
    // 課題3: fetchPair
    // ─────────────────────────────────────────
    @Test("fetchPair - 並列取得")
    func testFetchPair() async {
        let (first, second) = await fetchPair(first: "Alice", second: "Bob")
        #expect(first == "Hello, Alice!")
        #expect(second == "Hello, Bob!")
    }

    @Test("fetchPair - 同じ名前")
    func testFetchPairSame() async {
        let (a, b) = await fetchPair(first: "Swift", second: "Swift")
        #expect(a == "Hello, Swift!")
        #expect(b == "Hello, Swift!")
    }
}

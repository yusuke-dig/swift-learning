import Testing
@testable import SwiftLearning

@Suite("Day23: Actor / Sendable")
struct Day23Tests {

    // 課題1: SafeCounter
    @Test("SafeCounter: increment / decrement / value")
    func testSafeCounter() async {
        let counter = SafeCounter()

        await counter.increment()
        await counter.increment()
        await counter.increment()
        let v1 = await counter.value
        #expect(v1 == 3)

        await counter.decrement()
        let v2 = await counter.value
        #expect(v2 == 2)

        // 複数回 decrement
        await counter.decrement()
        await counter.decrement()
        let v3 = await counter.value
        #expect(v3 == 0)
    }

    @Test("SafeCounter: 初期値は0")
    func testSafeCounterInitial() async {
        let counter = SafeCounter()
        let v = await counter.value
        #expect(v == 0)
    }

    // 課題2: SafeCache
    @Test("SafeCache: store / fetch / clear")
    func testSafeCache() async {
        let cache = SafeCache<String, Int>()

        await cache.store(key: "a", value: 1)
        await cache.store(key: "b", value: 2)

        let a = await cache.fetch(key: "a")
        let b = await cache.fetch(key: "b")
        #expect(a == 1)
        #expect(b == 2)

        // 存在しないキー
        let missing = await cache.fetch(key: "z")
        #expect(missing == nil)

        // clear後はすべて nil
        await cache.clear()
        let afterClear = await cache.fetch(key: "a")
        #expect(afterClear == nil)
    }

    @Test("SafeCache: 上書き保存")
    func testSafeCacheOverwrite() async {
        let cache = SafeCache<String, String>()
        await cache.store(key: "key", value: "first")
        await cache.store(key: "key", value: "second")
        let v = await cache.fetch(key: "key")
        #expect(v == "second")
    }

    // 課題3: parallelSum
    @Test("parallelSum: 2配列を並行合計")
    func testParallelSum() async {
        let result = await parallelSum(a: [1, 2, 3], b: [4, 5, 6])
        #expect(result == 21)
    }

    @Test("parallelSum: 空配列")
    func testParallelSumEmpty() async {
        let result = await parallelSum(a: [], b: [])
        #expect(result == 0)
    }

    @Test("parallelSum: 片方が空")
    func testParallelSumOneEmpty() async {
        let result = await parallelSum(a: [10, 20], b: [])
        #expect(result == 30)
    }
}

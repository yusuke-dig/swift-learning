import Testing
@testable import SwiftLearning

@Suite("Day14: ジェネリクス")
struct Day14Tests {

    // ─────────────────────────────────────────
    // 課題1: Stack<T>
    // ─────────────────────────────────────────
    @Test("Stack - 基本操作")
    func testStackBasic() {
        var stack = Stack<Int>()
        #expect(stack.isEmpty == true)
        #expect(stack.peek() == nil)
        #expect(stack.pop() == nil)

        stack.push(1)
        stack.push(2)
        stack.push(3)

        #expect(stack.isEmpty == false)
        #expect(stack.peek() == 3)
        #expect(stack.pop() == 3)
        #expect(stack.peek() == 2)
        #expect(stack.pop() == 2)
        #expect(stack.pop() == 1)
        #expect(stack.isEmpty == true)
    }

    @Test("Stack - 文字列でも使える")
    func testStackString() {
        var stack = Stack<String>()
        stack.push("apple")
        stack.push("banana")
        #expect(stack.peek() == "banana")
        #expect(stack.pop() == "banana")
        #expect(stack.pop() == "apple")
        #expect(stack.isEmpty == true)
    }

    // ─────────────────────────────────────────
    // 課題2: findFirst
    // ─────────────────────────────────────────
    @Test("findFirst - 整数")
    func testFindFirstInt() {
        let result = findFirst(in: [1, 2, 3, 4, 5], where: { $0 > 3 })
        #expect(result == 4)

        let none = findFirst(in: [1, 2, 3], where: { $0 > 10 })
        #expect(none == nil)
    }

    @Test("findFirst - 文字列")
    func testFindFirstString() {
        let result = findFirst(in: ["cat", "dog", "bird"], where: { $0.count > 3 })
        #expect(result == "bird")
    }

    @Test("findFirst - 空配列")
    func testFindFirstEmpty() {
        let result = findFirst(in: [Int](), where: { $0 > 0 })
        #expect(result == nil)
    }

    // ─────────────────────────────────────────
    // 課題3: swapValues
    // ─────────────────────────────────────────
    @Test("swapValues - 整数")
    func testSwapInt() {
        var a = 10
        var b = 20
        swapValues(&a, &b)
        #expect(a == 20)
        #expect(b == 10)
    }

    @Test("swapValues - 文字列")
    func testSwapString() {
        var x = "hello"
        var y = "world"
        swapValues(&x, &y)
        #expect(x == "world")
        #expect(y == "hello")
    }

    @Test("swapValues - 同じ値")
    func testSwapSameValue() {
        var a = 5
        var b = 5
        swapValues(&a, &b)
        #expect(a == 5)
        #expect(b == 5)
    }
}

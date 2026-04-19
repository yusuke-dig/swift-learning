import Testing
@testable import SwiftLearning

@Suite("Day01: 変数と定数")
struct Day01Tests {

    @Test("greet: 名前を挨拶文に変換できる")
    func testGreet() {
        #expect(greet(name: "Swift") == "Hello, Swift!")
        #expect(greet(name: "World") == "Hello, World!")
        #expect(greet(name: "太郎") == "Hello, 太郎!")
    }

    @Test("add: 2つの整数の合計を返す")
    func testAdd() {
        #expect(add(a: 3, b: 5) == 8)
        #expect(add(a: 0, b: 0) == 0)
        #expect(add(a: -1, b: 1) == 0)
        #expect(add(a: 100, b: 200) == 300)
    }

    @Test("isEven: 偶数・奇数を判定できる")
    func testIsEven() {
        #expect(isEven(4) == true)
        #expect(isEven(7) == false)
        #expect(isEven(0) == true)
        #expect(isEven(-2) == true)
        #expect(isEven(-3) == false)
    }
}

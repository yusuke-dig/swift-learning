import Testing
@testable import SwiftLearning

@Suite("Day10: プロトコル")
struct Day10Tests {

    // ── 課題1: Book ─────────────────────────────────────────
    @Test("Book: describe は『title』by author の形式")
    func testBookDescribe() {
        let book = Book(title: "Swift入門", author: "山田太郎")
        #expect(book.describe() == "『Swift入門』by 山田太郎")
    }

    @Test("Book: 別のタイトル・著者でも正しい形式")
    func testBookDescribeOther() {
        let book = Book(title: "Clean Code", author: "Robert Martin")
        #expect(book.describe() == "『Clean Code』by Robert Martin")
    }

    // ── 課題2: Counter ──────────────────────────────────────
    @Test("Counter: increment で count が増える")
    func testCounterIncrement() {
        var c = Counter()
        c.increment()
        c.increment()
        #expect(c.count == 2)
    }

    @Test("Counter: reset で count が 0 に戻る")
    func testCounterReset() {
        var c = Counter()
        c.increment()
        c.increment()
        c.reset()
        #expect(c.count == 0)
    }

    @Test("Counter: 初期値は 0")
    func testCounterInitialValue() {
        let c = Counter()
        #expect(c.count == 0)
    }

    // ── 課題3: describeAll ──────────────────────────────────
    @Test("describeAll: 複数の Describable を改行で連結")
    func testDescribeAll() {
        let items: [Describable] = [
            Book(title: "A", author: "X"),
            Book(title: "B", author: "Y"),
        ]
        let result = describeAll(items)
        #expect(result == "『A』by X\n『B』by Y")
    }

    @Test("describeAll: 1要素なら改行なし")
    func testDescribeAllSingle() {
        let items: [Describable] = [Book(title: "A", author: "X")]
        #expect(describeAll(items) == "『A』by X")
    }

    @Test("describeAll: 空配列なら空文字")
    func testDescribeAllEmpty() {
        let items: [Describable] = []
        #expect(describeAll(items) == "")
    }
}

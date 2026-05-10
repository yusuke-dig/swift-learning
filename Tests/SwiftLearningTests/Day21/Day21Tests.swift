import Testing
@testable import SwiftLearning

@Suite("Day21: @Observable / ObservableObject")
struct Day21Tests {

    // ─────────────────────────────────────────
    // 課題1: CounterModel
    // ─────────────────────────────────────────
    @Test("CounterModel: increment / decrement")
    func testCounterModel() {
        let counter = CounterModel()
        #expect(counter.count == 0)

        counter.increment()
        counter.increment()
        #expect(counter.count == 2)

        counter.decrement()
        #expect(counter.count == 1)

        // 0 を下回らない
        counter.decrement()
        counter.decrement()
        #expect(counter.count == 0)
    }

    // ─────────────────────────────────────────
    // 課題2: TodoModel
    // ─────────────────────────────────────────
    @Test("TodoModel: addItem / removeItem")
    func testTodoModel() {
        let todo = TodoModel()
        #expect(todo.items.isEmpty)

        todo.addItem("牛乳を買う")
        todo.addItem("洗濯をする")
        #expect(todo.items.count == 2)
        #expect(todo.items[0] == "牛乳を買う")

        // 空文字は無視
        todo.addItem("")
        #expect(todo.items.count == 2)

        // 正常削除
        todo.removeItem(at: 0)
        #expect(todo.items.count == 1)
        #expect(todo.items[0] == "洗濯をする")

        // 範囲外インデックスは無視
        todo.removeItem(at: 99)
        #expect(todo.items.count == 1)
    }

    // ─────────────────────────────────────────
    // 課題3: ScoreModel (ObservableObject)
    // ─────────────────────────────────────────
    @Test("ScoreModel: addScore / average")
    func testScoreModel() {
        let model = ScoreModel()
        #expect(model.scores.isEmpty)
        #expect(model.average() == 0.0)

        model.addScore(80)
        model.addScore(100)
        model.addScore(60)
        #expect(model.scores.count == 3)
        #expect(model.average() == 80.0)

        // 範囲外は無視
        model.addScore(-1)
        model.addScore(101)
        #expect(model.scores.count == 3)

        // 境界値は有効
        model.addScore(0)
        model.addScore(100)
        #expect(model.scores.count == 5)
    }
}

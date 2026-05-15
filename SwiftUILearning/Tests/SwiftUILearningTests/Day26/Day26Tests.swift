import Testing
import SwiftUI
@testable import SwiftUILearning

// List/ForEach/NavigationStack はUIテストが困難なため、
// モデルのプロパティと @State の初期値を検証する。
// 画面遷移は Xcode の #Preview で確認すること。

@MainActor
@Suite("Day26: SwiftUI List / ForEach / NavigationStack")
struct Day26Tests {

    @Test("課題1: TodoRow が item を受け取れる")
    func todoRowReceivesItem() {
        let item = TodoItem(title: "牛乳を買う", isDone: true)
        let row = TodoRow(item: item)
        #expect(row.item.title == "牛乳を買う")
        #expect(row.item.isDone == true)
    }

    @Test("課題2: TodoListView の初期 items は 3 件")
    func todoListViewInitialItems() {
        let view = TodoListView()
        #expect(view.items.count == 3)
    }

    @Test("課題2: TodoListView の初期 items に完了済みが含まれる")
    func todoListViewHasDoneItem() {
        let view = TodoListView()
        let doneCount = view.items.filter { $0.isDone }.count
        #expect(doneCount >= 1)
    }

    @Test("課題3: TodoDetailView が item を受け取れる")
    func todoDetailViewReceivesItem() {
        let item = TodoItem(title: "散歩に行く", isDone: false)
        let detail = TodoDetailView(item: item)
        #expect(detail.item.title == "散歩に行く")
        #expect(detail.item.isDone == false)
    }

    @Test("モデル: TodoItem は Identifiable に準拠している")
    func todoItemIsIdentifiable() {
        let a = TodoItem(title: "タスクA")
        let b = TodoItem(title: "タスクB")
        #expect(a.id != b.id)
    }
}

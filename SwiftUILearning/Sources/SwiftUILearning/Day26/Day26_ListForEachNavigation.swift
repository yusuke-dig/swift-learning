// Day26: SwiftUI List / ForEach / NavigationStack
// テーマ: Todoリスト画面を作りながらリストとナビゲーションを練習する

import SwiftUI

// ─────────────────────────────────────────
// 解説
// ─────────────────────────────────────────
// List: スクロール可能な行リストを作る
//   List(items) { item in  Text(item.title)  }
//   または List { ForEach(items) { ... } } の形でも書ける
//
// ForEach: Identifiable なコレクションを繰り返し描画する
//   ForEach(items) { item in  TodoRow(item: item)  }
//   ※ items の要素は Identifiable (id プロパティ) が必要
//
// NavigationStack + NavigationLink: 画面遷移
//   NavigationStack {
//       List(items) { item in
//           NavigationLink(item.title, value: item)
//       }
//       .navigationDestination(for: TodoItem.self) { item in
//           TodoDetailView(item: item)
//       }
//   }
//   ※ TodoItem は Hashable が必要（Identifiable + Hashable で OK）
// ─────────────────────────────────────────

// モデル（変更不要）
struct TodoItem: Identifiable, Hashable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
    }
}

// 課題1: TodoRow（易）
// - let item: TodoItem を受け取る
// - HStack で「isDone なら ✅、未完了なら ⬜」と item.title を横並びに表示する
// - 例: ✅ 牛乳を買う  /  ⬜ 読書する
struct TodoRow: View {
    let item: TodoItem

    var body: some View {
        // ここに実装してください
        EmptyView()
    }
}

// 課題2: TodoListView（中）
// - @State var items: [TodoItem] を以下の初期値で持つ（テストで件数を検証）
//     TodoItem(title: "牛乳を買う", isDone: true)
//     TodoItem(title: "読書する")
//     TodoItem(title: "散歩に行く")
// - NavigationStack の中に List を置き、ForEach で TodoRow を並べる
// - .navigationTitle("Todoリスト") を付ける
// - 各行を NavigationLink でラップして TodoDetailView へ遷移させる
//   （navigationDestination(for: TodoItem.self) を使う）
struct TodoListView: View {
    @State var items: [TodoItem] = []

    var body: some View {
        // ここに実装してください
        EmptyView()
    }
}

// 課題3: TodoDetailView（中）
// - let item: TodoItem を受け取る
// - VStack(spacing: 16) で以下を縦並び表示する
//     Text(item.title)   ← .font(.title) を付ける
//     Text(item.isDone ? "完了: ✅" : "完了: ⬜")
// - .navigationTitle(item.title) を付ける
// - .padding() を付ける
struct TodoDetailView: View {
    let item: TodoItem

    var body: some View {
        // ここに実装してください
        EmptyView()
    }
}

// ─────────────────────────────────────────
// Preview（Xcode で開いて確認してください）
// ─────────────────────────────────────────
#Preview("課題1: 行") {
    List {
        TodoRow(item: TodoItem(title: "牛乳を買う", isDone: true))
        TodoRow(item: TodoItem(title: "読書する"))
    }
}

#Preview("課題2: リスト全体") {
    TodoListView()
}

#Preview("課題3: 詳細") {
    NavigationStack {
        TodoDetailView(item: TodoItem(title: "散歩に行く", isDone: false))
    }
}

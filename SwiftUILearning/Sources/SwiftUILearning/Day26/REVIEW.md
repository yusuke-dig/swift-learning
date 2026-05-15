# Day26 Review: SwiftUI List / ForEach / NavigationStack

## 課題1: TodoRow

### 実装
```swift
var body: some View {
    HStack {
        Text(item.isDone ? "✅" : "⬜")
        Text(item.title)
    }
}
```

### 良かった点
三項演算子を使った条件付きアイコン表示がシンプルでわかりやすい。SwiftUI では `Text` を並べる基本パターンがきれいに書けている。

---

## 課題2: TodoListView

### 実装
```swift
NavigationStack {
    List {
        ForEach(items) { item in
            NavigationLink(value: item) {
                TodoRow(item: item)
            }
        }
    }
    .navigationTitle(Text("Todoリスト"))
    .navigationDestination(for: TodoItem.self) { item in
        TodoDetailView(item: item)
    }
}
```

### 良かった点
`NavigationLink(value:)` + `navigationDestination(for:)` という iOS 16 以降の推奨パターンを正しく使えている。古い `NavigationLink(destination:)` ではなくこちらを選んだのは良い判断。`.navigationTitle` を `List` に付けるのも正しい位置。

### より良い書き方（参考）
`Text("Todoリスト")` の代わりに文字列リテラルを直接渡せる。

```swift
.navigationTitle("Todoリスト")
```

どちらも動作は同じだが、文字列リテラルが一般的な書き方。

---

## 課題3: TodoDetailView

### 実装
```swift
var body: some View {
    VStack(spacing: 16) {
        Text(item.title)
            .font(.title)
        Text(item.isDone ? "完了: ✅" : "完了: ⬜")
    }
    .padding()
    .navigationTitle(item.title)
}
```

### 良かった点
`.navigationTitle` を VStack の外に付けており、モディファイアの階層が正しい。`.padding()` を VStack 全体に適用するパターンも自然な書き方。

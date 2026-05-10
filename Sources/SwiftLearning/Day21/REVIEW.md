# Day21 Review: @Observable / ObservableObject

## 課題1: CounterModel

**実装**
```swift
@Observable
class CounterModel {
    var count: Int = 0

    func increment() {
        count += 1
    }

    func decrement() {
        guard count > 0 else { return }
        count -= 1
    }
}
```

**良かった点**
`guard count > 0 else { return }` で下限ガードを明示的に書けている。`count = max(0, count - 1)` とも書けるが、「条件を満たさなければ早期リターン」という意図が `guard` の方が読み手に伝わりやすい。

---

## 課題2: TodoModel

**実装**
```swift
@Observable
class TodoModel {
    var items: [String] = []

    func addItem(_ item: String) {
        guard !item.isEmpty else { return }
        items.append(item)
    }

    func removeItem(at: Int) {
        guard items.indices.contains(at) else { return }
        items.remove(at: at)
    }
}
```

**良かった点**
`items.indices.contains(at)` でインデックスバリデーションを書けている。空配列や負のインデックスも安全にガードできる Swifty な書き方。

**より良い書き方（あれば）**
引数ラベルと内部名を分けると可読性が上がる。

```swift
func removeItem(at index: Int) {
    guard items.indices.contains(index) else { return }
    items.remove(at: index)
}
```

`at: at` の繰り返しが消えて読みやすくなる。

---

## 課題3: ScoreModel

**実装**
```swift
class ScoreModel: ObservableObject {
    @Published var scores: [Int] = []

    func addScore(_ score: Int) {
        guard (0...100) ~= score else { return }
        scores.append(score)
    }

    func average() -> Double {
        guard !scores.isEmpty else { return 0.0 }
        return scores.reduce(0.0) { $0 + Double($1) } / Double(scores.count)
    }
}
```

**良かった点**
- `(0...100) ~= score` のパターンマッチ演算子 `~=` を使いこなせている。`score >= 0 && score <= 100` より簡潔で意図が明確。
- `guard !scores.isEmpty` で空配列のゼロ除算を防ぎ、`0.0` を返す処理も正確。
- `@Published` を付ける場所・`ObservableObject` への準拠も正しく書けている。

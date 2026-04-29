# Day10 Review: プロトコル

## 課題1: Book

**実装:**
```swift
func describe() -> String {
    return "『\(title)』by \(author)"
}
```

**良かった点:**
- 文字列補間をシンプルに使えている。
- `return` を明示的に書いており、読みやすい。より Swift らしく省略する書き方もある（どちらでも正解）。

---

## 課題2: Counter

**実装:**
```swift
mutating func increment() {
    self.count += 1
}

mutating func reset() {
    self.count = 0
}
```

**良かった点:**
- `mutating` を正しく付けられている。struct でプロパティを変更するときに必要なキーワードで、プロトコル側の `mutating func reset()` の宣言とも一致している。
- `self.count` と明示しているが、同名のローカル変数がない場合は `count += 1` と省略しても同じ意味。

---

## 課題3: describeAll

**実装:**
```swift
func describeAll(_ items: [Describable]) -> String {
    items.map { $0.describe() }.joined(separator: "\n")
}
```

**良かった点:**
- `map` + `joined` の組み合わせで1行にまとめられている。これは Swift で文字列リストを連結するときの典型的なイディオム。
- `$0` で引数を省略した簡潔なクロージャになっている。
- 空配列のとき `joined` が自動的に空文字を返すので、条件分岐が不要。

**より良い書き方（参考）:**
```swift
// map と joined を分けて書くと意図がより明確になる場合もある
func describeAll(_ items: [Describable]) -> String {
    let descriptions = items.map { $0.describe() }
    return descriptions.joined(separator: "\n")
}
```
1行版と2行版どちらも正解。チームやコードの文脈に合わせて選ぶとよい。

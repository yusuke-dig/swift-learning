# Day16 Review: Equatable / Comparable / Hashable

## 課題1: isEqual

```swift
func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    a == b
}
```

`return` を省略した1行実装。ジェネリクスと型制約の組み合わせも正確に書けている。

## 課題2: comparePoints

```swift
func comparePoints(_ lhs: Point16, _ rhs: Point16) -> String {
    if lhs < rhs { return "less" }
    if lhs == rhs { return "equal" }
    if lhs > rhs { return "greater" }
    return "unkwnon"
}
```

3つの `if` で全パターンを網羅できていて正しい。ただし `return "unkwnon"` はタイポかつ到達しないコード。`else` でまとめると意図が明確になる。

```swift
// より良い書き方
func comparePoints(_ lhs: Point16, _ rhs: Point16) -> String {
    if lhs < rhs { "less" }
    else if lhs == rhs { "equal" }
    else { "greater" }
}
```

`if/else if/else` にすることで「最後の分岐はそれ以外のすべて」という意図が伝わり、到達しない `return` も不要になる。

## 課題3: uniqueElements

```swift
func uniqueElements<T: Hashable>(_ array: [T]) -> [T] {
    return Array(Set(array))
}
```

`Array(Set(array))` はSwiftで重複排除の定番イディオム。`Hashable` 制約が `Set` に必要な理由も今日の学習内容と直結している。`return` は省略できるが、今回は書いても問題なし。

# Day06 Review: 関数 (引数ラベル/デフォルト値/inout)

## 課題1: repeatString(text:count:)

**実装**
```swift
func repeatString(text: String, count: Int = 2) -> String {
    var result: String = ""
    for _ in 0..<count {
        result += text
    }
    return result
}
```

**より良い書き方**
```swift
func repeatString(text: String, count: Int = 2) -> String {
    String(repeating: text, count: count)
}
```
`String(repeating:count:)` で1行に書ける。ただし、`for-in` でループしながら `+=` する今回の書き方はデフォルト引数の動作を確認するうえで十分明快。

---

## 課題2: swapInts(_:_:)

**実装**
```swift
func swapInts(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}
```

**良かった点**  
`inout` の典型的な実装パターン（一時変数を使った3ステップ）を正確に書けている。タプルを使った `(a, b) = (b, a)` という省略形もあるが、処理の流れが明確なこちらの書き方で問題ない。

---

## 課題3: clamp(_:lower:upper:)

**実装**
```swift
func clamp(_ value: Int, lower: Int, upper: Int) -> Int {
    guard value >= lower else { return lower }
    guard value <= upper else { return upper }
    return value
}
```

**より良い書き方**
```swift
func clamp(_ value: Int, lower: Int, upper: Int) -> Int {
    max(lower, min(value, upper))
}
```
`max/min` のネストで1行に書ける。ただし `guard` を使った今回の書き方は条件ごとに読み下せて非常に読みやすい。どちらも正解。

# Day04 Review: コレクション

## 課題1: sum

**実装**
```swift
func sum(_ numbers: [Int]) -> Int {
    var result = 0
    numbers.forEach { result += $0 }
    return result
}
```

**より良い書き方**
```swift
func sum(_ numbers: [Int]) -> Int {
    numbers.reduce(0, +)
}
```

`forEach` + ミュータブル変数でも正しい。`reduce` を使うと「初期値 + 畳み込み演算子」の1行で書ける。`$0` の使い方は正確で良い。

---

## 課題2: countOccurrences

**実装**
```swift
func countOccurrences(_ array: [Int], target: Int) -> Int {
    let result = array.filter { $0 == target }
    return result.count
}
```

**より良い書き方**
```swift
func countOccurrences(_ array: [Int], target: Int) -> Int {
    array.filter { $0 == target }.count
}
```

`filter` の使い方は完璧。中間変数 `result` を省いてメソッドチェーンにするとより簡潔になる。

---

## 課題3: mostFrequent

**実装**
```swift
func mostFrequent(_ array: [Int]) -> Int? {
    guard !array.isEmpty else { return nil }

    var result: [Int: Int] = [:]
    array.forEach {
        result[$0] = (result[$0] ?? 0) + 1
    }

    return result.max(by: { $0.value < $1.value })?.key
}
```

**良かった点**

この実装は非常に良い。特に注目すべき点：

- `guard !array.isEmpty` で早期リターン（Day03 で学んだ `guard` の応用）
- `result[$0] ?? 0` でキーが存在しない場合のデフォルト値を正しく処理
- `Dictionary.max(by:)` で最大値のエントリを取得し `.key` で値を取り出す流れがスマート

`(result[$0] ?? 0) + 1` のパターンは Dictionary で頻度カウントするときの定番イディオムなので覚えておくと便利。

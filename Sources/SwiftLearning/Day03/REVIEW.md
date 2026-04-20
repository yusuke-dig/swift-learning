# Day03 Review: オプショナル

## 課題1: safeDivide

**実装**
```swift
func safeDivide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil
    } else {
        return a / b
    }
}
```

**より良い書き方**
```swift
func safeDivide(_ a: Double, _ b: Double) -> Double? {
    guard b != 0 else { return nil }
    return a / b
}
```

`guard` で早期リターンにすると「正常系だけ下に続く」という構造になり読みやすくなる。`if-else` でも正しいが、Swiftでは `guard` が慣用的。

---

## 課題2: firstElement

**実装**
```swift
func firstElement(_ array: [Int]) -> Int? {
    if array.isEmpty {
        return nil
    }
    return array.first
}
```

**より良い書き方**
```swift
func firstElement(_ array: [Int]) -> Int? {
    return array.first
}
// または
func firstElement(_ array: [Int]) -> Int? { array.first }
```

`Array.first` は空配列に対して自動で `nil` を返す (`Int?` 型)。`isEmpty` チェックは不要。`Array.first` の戻り型が `Optional` であることを活かすとシンプルになる。

---

## 課題3: parseAge

**実装**
```swift
func parseAge(_ s: String) -> Int? {
    let int = Int(s)
    guard let int else { return nil }
    if(int >= 0 && int <= 120) {
        return int
    } else {
        return nil
    }
}
```

**良かった点・より良い書き方**

`guard let int else { return nil }` で `Int(s)` が `nil` のケースを早期リターンしているのは良い書き方。

範囲チェックは `(0...120).contains(int)` や `if int >= 0 && int <= 120` でも正しいが、`guard` に続けることもできる:

```swift
func parseAge(_ s: String) -> Int? {
    guard let age = Int(s), (0...120).contains(age) else { return nil }
    return age
}
```

`guard` の条件はカンマ `,` で複数並べられる。変換と範囲チェックを1行にまとめられて簡潔。

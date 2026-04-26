# Day07 Review: クロージャ

## 課題1: applyTwice(_:_:)

**実装**
```swift
func applyTwice(_ x: Int, _ f: (Int) -> Int) -> Int {
    let result = f(x)
    return f(result)
}
```

**良かった点**  
中間結果を `result` に名前付きで受けていて、「1回目を適用 → 2回目を適用」の流れが読みやすい。1行で `return f(f(x))` とも書けるが、今回の書き方の方が意図が伝わりやすい。

---

## 課題2: myFilter(_:_:)

**実装**
```swift
func myFilter(_ array: [Int], _ predicate: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    for num in array {
        guard predicate(num) != false else { continue }
        result.append(num)
    }
    return result
}
```

**より良い書き方**
```swift
func myFilter(_ array: [Int], _ predicate: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    for num in array {
        if predicate(num) { result.append(num) }
    }
    return result
}
```

`predicate(num) != false` は `predicate(num)` と同じ意味なので冗長。`Bool` の比較に `!= false` は書かないのがSwiftの慣習。`guard` より `if` の方がここでは素直に読める。

---

## 課題3: myMap(_:_:)

**実装**
```swift
func myMap(_ array: [Int], _ transform: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for num in array {
        result.append(transform(num))
    }
    return result
}
```

**良かった点**  
シンプルで正確。クロージャを受け取って各要素に適用するパターンの基本形を正しく書けている。標準ライブラリの `map` が内部でやっていることをそのまま手書きした形。

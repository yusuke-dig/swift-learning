# Day13 レビュー: 高階関数 (map / filter / reduce)

## 課題1: doubleAll

**実装**
```swift
numbers.map { $0 * 2 }
```

**良かった点**
`map` を1行でスッキリ書けている。`return` を省略した暗黙的 return も自然に使えている。

---

## 課題2: onlyEven

**実装**
```swift
numbers.filter { $0.isMultiple(of: 2) }
```

**良かった点**
`$0 % 2 == 0` ではなく `isMultiple(of:)` を選んだのが◎。Swift らしい読みやすい書き方。

---

## 課題3: sumAll

**実装**
```swift
numbers.reduce(0, { $0 + $1 })
```

**より良い書き方**
```swift
numbers.reduce(0, +)
```

`+` は `(Int, Int) -> Int` 型の関数なのでそのまま渡せる。末尾クロージャ形式にするなら `reduce(0) { $0 + $1 }` も等価。どちらも正解だが、演算子を直接渡す形が最も簡潔。

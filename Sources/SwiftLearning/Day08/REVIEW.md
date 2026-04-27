# Day08 Review: 構造体 (struct)

## 課題1: `distance(from:to:)`

**実装**
```swift
func distance(from a: Point, to b: Point) -> Double {
    let dx = b.x - a.x
    let dy = b.y - a.y
    return sqrt(dx * dx + dy * dy)
}
```

**良かった点**
dx・dy を名前付き変数に分けて計算を読みやすくしている。`sqrt(dx*dx + dy*dy)` はユークリッド距離の定義をそのまま表現しており、明快。

**より良い書き方（参考）**
`Foundation` の `hypot` 関数を使うと一行で書ける。
```swift
return hypot(b.x - a.x, b.y - a.y)
```
ただし可読性は現在の実装とほぼ同等なので、どちらでも問題なし。

---

## 課題2: `Rectangle.area()` / `perimeter()`

**実装**
```swift
func area() -> Double {
    width * height
}

func perimeter() -> Double {
    2 * (width + height)
}
```

**良かった点**
`return` を省略した式ボディ（implicit return）を使いこなしている。1行で収まる関数はこの形が Swift らしくてよい。`2 * (width + height)` も `(width + height) * 2` より意図が伝わりやすい。

---

## 課題3: `Stack`

**実装**
```swift
var isEmpty: Bool {
    storage.isEmpty
}

mutating func push(_ value: Int) {
    storage.append(value)
}

mutating func pop() -> Int? {
    storage.popLast()
}
```

**良かった点**
`popLast()` が「空なら nil を返す `Optional` 操作」であることを正確に把握して使えている。`storage.last; storage.removeLast()` の 2行パターンより簡潔で、Swift の標準ライブラリを上手く活用している。`isEmpty` も computed property の implicit return で一行にまとめられている。

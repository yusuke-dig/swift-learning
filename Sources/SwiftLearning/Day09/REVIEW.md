# Day09 Review: クラスと継承

## 課題1: Circle

**実装:**
```swift
init(color: String, radius: Double) {
    self.radius = radius
    super.init(color: color)
}

override func area() -> Double {
    Double.pi * pow(radius, 2)
}
```

**良かった点:**
- Swift の Two-phase initialization を正しく理解している。`self.radius = radius` を先に行い、その後 `super.init` を呼ぶ順序が正確。
- `pow(radius, 2)` は明快。`radius * radius` でも同等だが、べき乗を使うことで意図が読みやすい。

---

## 課題2: Rect

**実装:**
```swift
init(color: String, width: Double, height: Double) {
    self.width = width
    self.height = height
    super.init(color: color)
}

override func area() -> Double {
    width * height
}
```

**良かった点:**
- 複数プロパティを全て初期化してから `super.init` を呼ぶパターンを正しく踏めている。
- `area()` がシンプルで読みやすい。

---

## 課題3: isLarger

**実装:**
```swift
func isLarger(_ a: Shape, _ b: Shape) -> Shape {
    a.area() >= b.area() ? a : b
}
```

**良かった点:**
- 三項演算子で1行にまとめており、簡潔で意図が明確。
- `>=` で同値を `a` に倒すという仕様を一行で表現できている。

**より良い書き方（参考）:**
```swift
// b.area() > a.area() の場合のみ b を返す、という読み方も自然
func isLarger(_ a: Shape, _ b: Shape) -> Shape {
    return b.area() > a.area() ? b : a
}
```
どちらも正解。`>` vs `>=` の向きで同値の扱いが変わるので、仕様に合わせて選ぶとよい。

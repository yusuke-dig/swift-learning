# Day12 Review: 列挙型

## 課題1: Direction.opposite

**実装:**
```swift
var opposite: Direction {
    switch self {
    case .north: return .south
    case .south: return .north
    case .east:  return .west
    case .west:  return .east
    }
}
```

**良かった点:**
- switch が全 case を網羅しているため default が不要。case が増えたときにコンパイルエラーで気づける設計になっている。
- computed property として実装できており、`direction.opposite` と自然に呼べる。

---

## 課題2: Coin.value

**実装:**
```swift
var value: Int {
    switch self {
    case .one:         return 1
    case .five:        return 5
    case .ten:         return 10
    case .fifty:       return 50
    case .hundred:     return 100
    case .fiveHundred: return 500
    }
}
```

**良かった点:**
- 6 case を漏れなく網羅している。

**参考: RawValue を使う書き方:**
```swift
enum Coin: Int {
    case one = 1, five = 5, ten = 10
    case fifty = 50, hundred = 100, fiveHundred = 500
}
// Coin.fifty.rawValue → 50
```

Int の rawValue を持つ enum にすると、switch を書かずに値を取り出せる。今回のように「case と値が1対1」の場合は rawValue の方がシンプルになることが多い。

---

## 課題3: area(of:)

**実装:**
```swift
func area(of figure: Figure) -> Double {
    switch figure {
    case .circle(radius: let r):              return .pi * r * r
    case .rectangle(width: let w, height: let h): return w * h
    case .triangle(base: let b, height: let h):   return b * h / 2
    }
}
```

**良かった点:**
- associated values を `let` で取り出すパターンを正確に使えている。
- `.pi` と省略して書けている（型推論で `Double.pi` と解釈される）。
- `r * r` は `pow(r, 2)` と同義で、シンプルな掛け算の方が読みやすいのでこちらが好ましい。

# Day14 Review: ジェネリクス

## 課題1: Stack<T>

**実装**
```swift
mutating func push(_ item: T) {
    self.items.append(item)
}

mutating func pop() -> T? {
    self.items.popLast()
}

func peek() -> T? {
    self.items.last
}

var isEmpty: Bool {
    self.items.isEmpty
}
```

**より良い書き方**
```swift
// self. は省略できる。Swift では通常省略するのが慣習
mutating func push(_ item: T) {
    items.append(item)
}

mutating func pop() -> T? {
    items.popLast()
}
```

`self.` を付けること自体は正しく、エラーにもならない。ただし Swift のコーディングスタイルでは `self.` はクロージャ内でのキャプチャ明示など「必要なとき」だけ書くのが慣習。

---

## 課題2: findFirst<T>

**実装**
```swift
func findFirst<T>(in array: [T], where predicate: (T) -> Bool) -> T? {
    array.first(where: predicate)
}
```

**良かった点**

標準ライブラリの `first(where:)` を正しく活用できている。自前でループを書かずに済む一行実装で、意図も明確。ジェネリクスの本質「ロジックは共通、型だけ可変」をきれいに表現できている。

---

## 課題3: swapValues<T>

**実装**
```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let evacuation = a
    a = b
    b = evacuation
}
```

**より良い書き方**
```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
```

ロジックは完全に正しい。変数名 `evacuation`（退避）は意味を込めた命名だが、`temp` や `tmp` のほうがスワップ処理のイディオムとして広く通じる。

---

## 総評

3課題とも正確に実装できている。特に `findFirst` で標準ライブラリをそのまま活用した点が良い。ジェネリクスの核心「`<T>` を宣言するだけで型を問わず動く」を自然に理解して書けている。

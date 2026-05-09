# Day20 Review: @propertyWrapper

## 課題1: @Clamped

### 実装
```swift
var wrappedValue: Int {
    get { value }
    set {
        value = Swift.max(min, Swift.min(max, newValue))
    }
}

init(wrappedValue: Int, min: Int, max: Int) {
    self.min = min
    self.max = max
    self.value = Swift.max(min, Swift.min(max, wrappedValue))
}
```

### 良かった点
`Swift.max` / `Swift.min` と名前空間を明示しているのが正確です。struct に `min`・`max` というプロパティを定義しているため、そのまま `max(...)` と書くとコンパイラがどちらを指しているか迷います。`Swift.` を付けて標準ライブラリの関数だと明示するのは、こういう衝突を避けるための正しい対処です。

init でも同じクランプ処理を適用しているのも正しいです。初期値が範囲外でも正しく丸まります。

---

## 課題2: @Trimmed

### 実装
```swift
var wrappedValue: String {
    get { value }
    set {
        value = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

init(wrappedValue: String) {
    self.value = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
}
```

### 良かった点
`.whitespacesAndNewlines` を使っているのが適切です。`.whitespaces` だと改行が除去されません。テストに改行ケースがあるので、これを選べたのは正確に挙動を理解している証拠です。

setter と init で同じ処理を書くのは Clamped と同じ構造で、一貫しています。

---

## 課題3: @ClampedWithProjection

### 実装
```swift
var wrappedValue: Int {
    get { value }
    set {
        value = Swift.max(min, Swift.min(max, newValue))
        projectedValue = newValue < min || newValue > max
    }
}

init(wrappedValue: Int, min: Int, max: Int) {
    self.min = min
    self.max = max
    value = Swift.max(min, Swift.min(max, wrappedValue))
    projectedValue = wrappedValue < min || wrappedValue > max
}
```

### 良かった点
クランプ後の `value` ではなく、クランプ前の `newValue` と範囲を比較して `projectedValue` を決めているのが正確です。クランプ後の値で比較すると常に範囲内になるため、`projectedValue` が常に `false` になってしまいます。元の値と範囲を比較する必要があると気づいたのは理解が深い証拠です。

`private(set) var projectedValue` とすることで「外から読める・外から書けない」を正しく表現できています。

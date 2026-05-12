# Day23 Review: Actor / Sendable

## 課題1: SafeCounter

**実装**
```swift
func increment() {
    count += 1
}

func decrement() {
    count -= 1
}

var value: Int {
    return count
}
```

**良かった点**
シンプルかつ正確。`actor` 内部では `self` の状態に直接アクセスできること、`await` 不要なことを正しく理解できている。

**より良い書き方（あれば）**
`return` は computed property では省略できる。

```swift
var value: Int { count }
```

---

## 課題2: SafeCache<Key, Value>

**実装**
```swift
func store(key: Key, value: Value) {
    storage[key] = value
}

func fetch(key: Key) -> Value? {
    return storage[key]
}

func clear() {
    storage.removeAll()
}
```

**良かった点**
`Dictionary` の subscript で store / fetch を簡潔に表現できている。`removeAll()` を使った clear も適切。

**より良い書き方（あれば）**
`fetch` も `return` を省略できる。

```swift
func fetch(key: Key) -> Value? { storage[key] }
```

---

## 課題3: parallelSum

**実装**
```swift
func parallelSum(a: [Int], b: [Int]) async -> Int {
    func sum(_ arr: [Int]) -> Int {
        arr.reduce(0, +)
    }

    async let sumA = sum(a)
    async let sumB = sum(b)

    return await sumA + sumB
}
```

**良かった点**
`async let` を使って2つの合計を並行開始し、`await` で一括に待つ構造が完璧。`reduce(0, +)` でスッキリ書けている。`sum` をローカル関数として閉じ込める設計も良い。

**補足**
`async let` は同期関数 (`sum`) に対しても使えるが、実際に並行化されるのは `async` な処理に対してのみ。今回のように同期計算に対して使うのは学習として適切だが、実運用では `TaskGroup` や並行 IO に対して使うシーンが多い。

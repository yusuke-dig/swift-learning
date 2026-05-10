# Day22 Review: Combine 入門

## 課題1: collectFromSequence

**実装**
```swift
func collectFromSequence() -> [Int] {
    var results: [Int] = []
    let cancellable = Publishers.Sequence(sequence: [1, 2, 3])
        .sink { value in
            results.append(value)
        }
    _ = cancellable
    return results
}
```

**良かった点**
`_ = cancellable` で AnyCancellable を明示的に保持しているのが正確。
Publishers.Sequence は同期的に値を流すので、return 前に全値が収集される点を正しく理解できている。

## 課題2: sendWithSubject

**実装**
```swift
func sendWithSubject() -> [String] {
    var results: [String] = []
    let subject = PassthroughSubject<String, Never>()
    let cancellable = subject
        .sink(receiveValue: { value in
            results.append(value)
        })
    subject.send("Hello")
    subject.send("Combine")
    subject.send("World")
    _ = cancellable
    return results
}
```

**良かった点**
購読を先に張ってから `send` している順序が正しい。PassthroughSubject は購読前の値をバッファしないため、この順序は必須。

**より良い書き方（参考）**
クロージャの引数名を省略して `$0` で書くと簡潔になる：
```swift
let cancellable = subject.sink { results.append($0) }
```

## 課題3: mapAndFilter

**実装**
```swift
func mapAndFilter() -> [Int] {
    var results: [Int] = []
    let cancellable = Publishers.Sequence(sequence: 1...10)
        .map { $0 * 2 }
        .filter { $0 > 10 }
        .sink(receiveValue: { value in
            results.append(value)
        })
    _ = cancellable
    return results
}
```

**良かった点**
`map` → `filter` の順序が正確。逆（filter → map）にすると結果が変わるが、仕様通りに「2倍してから絞り込む」を実装できている。
オペレータチェーンが縦に並んでいて読みやすい。

# Day19 Review: Result<T, E> 型

## 課題1: parseScore

**実装**
```swift
func parseScore(_ input: String) -> Result<Int, ScoreError> {
    guard let score = Int(input) else { return .failure(.notANumber) }
    guard (0...100).contains(score) else { return .failure(.outOfRange) }
    return .success(score)
}
```

**良かった点**
`guard` による早期 return で、失敗ケースを先に排除してから `return .success(score)` という流れが明快。`(0...100).contains(score)` で範囲チェックを一行で表現できている。

## 課題2: safeFetch

**実装**
```swift
func safeFetch(id: String, from store: [String: String]) -> Result<String, FetchError> {
    if id == "secret" { return .failure(.unauthorized) }
    guard let value = store[id] else { return .failure(.notFound) }
    return .success(value)
}
```

**良かった点**
`id == "secret"` のチェックを辞書アクセスより先に置いている点が正確。もし辞書に `"secret"` キーが存在していても `.unauthorized` を返すという仕様を守れている。

## 課題3: fetchAndParseScore

**実装**
```swift
func fetchAndParseScore(id: String, from store: [String: String]) -> String {
    do {
        let safeValue = try safeFetch(id: id, from: store).get()
        let score = try parseScore(safeValue).get()
        return "OK: \(score)"
    } catch let err as ScoreError {
        return "\(err)"
    } catch let err as FetchError {
        return "\(err)"
    } catch {
        return "unknown error"
    }
}
```

**良かった点**
`get()` で Result を throw に変換し、`do-catch` で拾うパターンをきれいに使えている。エラー型ごとに `catch` を分けることで、型安全に文字列化できている。

**より良い書き方（参考）**
エラー型が同一であれば `flatMap` でチェーンできる。今回は `ScoreError` と `FetchError` が別型なので `mapError` でまとめる必要があり、`get()` + `do-catch` の方が読みやすい。エラー型を統一した設計にする場合は `flatMap` が有効な選択肢になる。

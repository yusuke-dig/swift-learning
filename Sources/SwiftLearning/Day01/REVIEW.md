# Day01 レビュー

## 課題1: greet

```swift
return "Hello, \(name)!"
```

✅ 文字列補間 `\()` の正しい使い方。

---

## 課題2: add

```swift
return a + b
```

✅ シンプルで明快。

---

## 課題3: isEven

```swift
// 実装
return (number % 2 == 0)

// より良い書き方
return number % 2 == 0
```

💡 `Bool` を返す式にカッコは不要。Swiftでは冗長になるので省くのが慣習。

---

## 総評

3問とも正しく動作。全体的にSwiftらしいシンプルな書き方ができている。

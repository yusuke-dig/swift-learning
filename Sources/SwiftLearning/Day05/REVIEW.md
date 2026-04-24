# Day05 Review: 制御構文

## 課題1: grade

**実装**
```swift
func grade(_ score: Int) -> String {
    switch score {
    case 90...100: return "A"
    case 70..<90:  return "B"
    case 50..<70:  return "C"
    default:       return "D"
    }
}
```

**良かった点**

完璧な実装。`...`（閉区間）と `..<`（半開区間）を正しく使い分けられている。`switch` で範囲マッチするのは Swift らしい書き方。

---

## 課題2: fizzBuzz

**実装**
```swift
func fizzBuzz(_ n: Int) -> [String] {
    var result: [String] = []
    for i in 1...n {
        switch i {
        case let FizzBuzz where FizzBuzz % 5 == 0 && FizzBuzz % 3 == 0:
            result.append("FizzBuzz")
        case let fizz where fizz % 3 == 0:
            result.append("Fizz")
        case let buzz where buzz % 5 == 0:
            result.append("Buzz")
        default:
            result.append("\(i)")
        }
    }
    return result
}
```

**より良い書き方**

`switch` + `where` を使ったアプローチは動作として正しい。ただ慣例として `case let` のバインド名は小文字始まりにする（`FizzBuzz` → `x` など）。

より一般的なのは `if-else` で書く方法：

```swift
for i in 1...n {
    if i % 15 == 0      { result.append("FizzBuzz") }
    else if i % 3 == 0  { result.append("Fizz") }
    else if i % 5 == 0  { result.append("Buzz") }
    else                 { result.append("\(i)") }
}
```

`% 15 == 0` で FizzBuzz をまとめて判定する方法もある。`switch + where` の使い方は Swift の応用知識として良い挑戦だった。

---

## 課題3: factorial

**実装**
```swift
func factorial(_ n: Int) -> Int {
    guard n != 0 else { return 1 }
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}
```

**良かった点**

`guard n != 0` で `0! = 1` を正しく処理している。`guard` が自然に使えるようになっている。

実は `guard` なしでも `for i in 1...n` は `n == 0` のとき `1...0` になりコンパイルエラー（実行時クラッシュ）になるため、このガードは必須。正しく気づいている。

# Day15 Review: 非同期処理

## 課題1: fetchGreeting

**実装**
```swift
func fetchGreeting(name: String) async -> String {
    "Hello, \(name)!"
}
```

**良かった点**

`async` 関数の基本を正確に書けている。返り値の文字列補間も簡潔で問題なし。トップレベルで `await` を試みてエラーを踏んだことも、「async コンテキストとは何か」を体で覚えるよい経験。

---

## 課題2: fetchAll

**実装**
```swift
func fetchAll(names: [String]) async -> [String] {
    var result: [String] = []
    for name in names {
        result.append(await fetchGreeting(name: name))
    }
    return result
}
```

**良かった点**

`map` でエラーを踏んだあと `for-in + await` に切り替えた判断が正しい。`async` コンテキストで逐次 `await` するイディオムを正確に書けている。

---

## 課題3: fetchPair

**実装**
```swift
func fetchPair(first: String, second: String) async -> (String, String) {
    let (greeting1, greeting2) = (await fetchGreeting(name: first), await fetchGreeting(name: second))
    return (greeting1, greeting2)
}
```

**改善点**

テストは通るが、これは**逐次実行**になっている。タプルの要素は左から順に評価されるため、`first` を待ってから `second` が始まる。

課題の意図は `async let` を使った**並列実行**だった。

```swift
// 並列実行（async let）
func fetchPair(first: String, second: String) async -> (String, String) {
    async let greeting1 = fetchGreeting(name: first)   // すぐ開始
    async let greeting2 = fetchGreeting(name: second)  // すぐ開始
    return await (greeting1, greeting2)                // 両方揃うまで待つ
}
```

`async let` の意味：宣言した時点で処理を**スタート**させ、`await` で結果を**受け取る**。両方が同時進行するので、処理が重いほど時間の短縮効果が出る。今回は関数が一瞬で返るため結果は同じだったが、実際のネットワーク通信では差が出る。

---

## 総評

課題1・2 は完璧。課題3 はテストが通ったものの、並列実行の仕組みを使いきれなかった。`async let` の「宣言でスタート、await で受け取り」という2段階の感覚は、最初はとっつきにくいが Swift の非同期設計の核心。実際のアプリで複数APIを叩く場面で思い出すと、`async let` の価値がわかる。

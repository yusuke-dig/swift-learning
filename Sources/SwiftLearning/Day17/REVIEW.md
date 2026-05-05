# Day17 Review: Codable (JSON)

## 課題1: encodeUser

**実装**
```swift
func encodeUser(_ user: User) throws -> String {
    let data = try JSONEncoder().encode(user)
    guard let jsonString = String(data: data, encoding: .utf8) else {
        throw EncodingError.invalidValue(user, .init(codingPath: [], debugDescription: "Failed to convert Data to String"))
    }
    return jsonString
}
```

**良かった点**
`guard let` でオプショナルバインディングを正しく行い、失敗時に `EncodingError` をスローしている点が丁寧。`String(data:encoding:)` が `nil` を返す状況は実際にはほぼ起こらないが、`!` 強制アンラップを避けているのは堅牢な書き方。

**よりシンプルな書き方（参考）**
実用コードでは `String(data:encoding:)` の失敗は起こり得ないため、短く書くことも多い：
```swift
func encodeUser(_ user: User) throws -> String {
    let data = try JSONEncoder().encode(user)
    return String(data: data, encoding: .utf8)!
}
```
どちらが正解ではなく、チームや用途に応じて使い分ける。

---

## 課題2: decodeUser

**実装**
```swift
func decodeUser(from json: String) throws -> User {
    let data = Data(json.utf8)
    let user = try JSONDecoder().decode(User.self, from: data)
    return user
}
```

**良かった点**
`Data(json.utf8)` で文字列から Data へ変換する慣用句が自然に書けている。`decode(_:from:)` のエラーをそのまま `rethrows` させているため、呼び出し側で型チェック（`DecodingError`）できる設計になっている。

**より短い書き方（参考）**
```swift
func decodeUser(from json: String) throws -> User {
    try JSONDecoder().decode(User.self, from: Data(json.utf8))
}
```

---

## 課題3: encodeProductAsSnakeCase

**実装**
```swift
func encodeProductAsSnakeCase(_ product: Product) throws -> String {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    let data = try encoder.encode(product)
    guard let jsonString = String(data: data, encoding: .utf8) else {
        throw EncodingError.invalidValue(product, .init(codingPath: [], debugDescription: "Failed to convert Data to String"))
    }
    return jsonString
}
```

**良かった点**
`encoder.keyEncodingStrategy = .convertToSnakeCase` を確実に設定できており、`productId` → `product_id`、`productName` → `product_name` へ変換されることを理解できている。課題1と一貫したエラーハンドリングスタイルで書かれており、コードの統一感がある。

**参考: 出力形式を整えたい場合**
```swift
encoder.outputFormatting = .sortedKeys  // キーをアルファベット順にソート
encoder.outputFormatting = .prettyPrinted  // インデント付きで読みやすく出力
```

# Day11 Review: エラー処理

## 課題1: parseTemperature

**実装:**
```swift
func parseTemperature(_ value: Double) throws -> Double {
    if value < -273.15 {
        throw TemperatureError.tooCold
    } else if value > 1000.0 {
        throw TemperatureError.tooHot
    } else {
        return value
    }
}
```

**良かった点:**
- 条件の向きが正確。`< -273.15` と `> 1000.0` で境界値（-273.15 と 1000.0 自体）を有効として扱えている。

**より良い書き方（参考）:**
```swift
func parseTemperature(_ value: Double) throws -> Double {
    if value < -273.15 { throw TemperatureError.tooCold }
    if value > 1000.0  { throw TemperatureError.tooHot }
    return value
}
```

guard や早期 return を使うと else のネストがなくなり、「正常系を最後に書く」流れが明確になる。どちらも正解。

---

## 課題2: safeSqrt

**実装:**
```swift
func safeSqrt(_ value: Double) throws -> Double {
    guard value >= 0 else { throw MathError.negativeInput }
    return sqrt(value)
}
```

**良かった点:**
- `guard` で早期 throw するパターンが Swift らしく、読みやすい。
- 正常系の `return sqrt(value)` がガードの後にフラットに書けている。

---

## 課題3: describeTemperature

**実装:**
```swift
func describeTemperature(_ value: Double) -> String {
    do {
        let result = try parseTemperature(value)
        return "\(result)℃ は有効です"
    } catch let error as TemperatureError {
        switch error {
            case .tooCold: return "低すぎます"
            case .tooHot:  return "高すぎます"
        }
    } catch {
        return "予期せぬエラー"
    }
}
```

**良かった点:**
- `catch let error as TemperatureError` でエラー型を絞り込んでから switch するパターンが正確。
- 末尾の `catch` で想定外のエラーも拾っており、コンパイラの要求（網羅性）を満たしている。
- switch の網羅性により、TemperatureError に新しい case が増えたときにコンパイルエラーで気づける設計になっている。

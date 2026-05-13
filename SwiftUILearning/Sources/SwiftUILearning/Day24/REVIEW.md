# Day24 Review: SwiftUI View / Text / Stack

## 課題1: GreetingView

**実装**
```swift
var body: some View {
    Text("こんにちは、\(name)さん！")
        .font(.title)
}
```

**良かった点**
- `\(name)` の文字列補間を Text 内で正しく使えている。
- `.font(.title)` をモディファイアチェーンで付けるパターンを習得できている。

---

## 課題2: ProfileInfoView

**実装**
```swift
var body: some View {
    VStack(alignment: .leading, spacing: 4) {
        Text(name)
            .font(.headline)
        Text(role)
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }
}
```

**良かった点**
- `.foregroundStyle(.secondary)` を使っている。deprecated な `.foregroundColor` ではなく、iOS 17 / macOS 14 時代の正しい API を選べている。

---

## 課題3: ProfileCardView

**実装**
```swift
var body: some View {
    HStack(spacing: 12) {
        Text(initial)
            .font(.largeTitle)
            .frame(width: 60, height: 60)
            .background(Color.blue.opacity(0.2))
            .clipShape(.circle)

        ProfileInfoView(name: name, role: role)
    }
    .padding()
    .background(.white)
    .cornerRadius(12)
    .shadow(radius: 4)
}
```

**良かった点**
- `.clipShape(.circle)` を Swift 5.9+ のキーパス構文で書けている（古い `Circle()` でも動くが、より簡潔）。
- 課題2で作った `ProfileInfoView` を再利用できている。これが SwiftUI の「小さいビューを組み合わせる」設計の核心。

**より良い書き方（2点）**

① `.cornerRadius(12)` は macOS 14 / iOS 17 以降 deprecated。

```swift
// 現在の書き方（動くが deprecated）
.cornerRadius(12)

// 推奨
.clipShape(.rect(cornerRadius: 12))
```

② `.background(.white)` はダークモードで白固定になる。実務では適応色を使う。

```swift
// 固定色（ダークモードで浮く）
.background(.white)

// 推奨: システムの背景色に追従する
.background(Color(.windowBackgroundColor))  // macOS
```

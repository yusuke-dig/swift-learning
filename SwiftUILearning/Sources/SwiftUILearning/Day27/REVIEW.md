# Day27 Review: SwiftUI @Environment / @EnvironmentObject

## 課題1: ThemeToggleButton

### 実装
```swift
Button(theme.isDark ? "ライトモード ON" : "ダークモード ON") {
    theme.isDark.toggle()
}
```

### 良かった点
三項演算子でラベルの切り替えを1行に収めており、読みやすい。`.toggle()` も的確。

### より良い書き方
`.buttonStyle(.borderedProminent)` が課題の指示に含まれていたが抜けている。見た目の差だけなので動作には影響しない。

---

## 課題2: ThemedCard

### 実装
```swift
VStack(alignment: .leading, spacing: 8) {
    Text(title)
        .font(.headline)
        .foregroundColor(theme.foreground)
    Text(description)
        .font(.body)
        .foregroundColor(theme.foreground)
}
.padding()
.background(theme.background)
.cornerRadius(12)
.shadow(radius: 4)
```

### 良かった点
モディファイアの順番（padding → background → cornerRadius → shadow）が正しく、角丸と影が意図通りに動く。

### より良い書き方
`.foregroundColor()` は iOS 17 以降で非推奨。同じ動作で警告が出ないのは `.foregroundStyle()`:
```swift
Text(title).foregroundStyle(theme.foreground)
```

---

## 課題3: ThemeRootView

### 実装
```swift
VStack(spacing: 24) {
    ThemeToggleButton()
    ThemedCard(title: "SwiftUI", description: "宣言的UIフレームワーク")
    ThemedCard(title: "環境オブジェクト", description: "ビューツリー全体で状態共有")
}
.padding()
.background(theme.background)
.ignoresSafeArea()
.environmentObject(theme)
```

### 良かった点
`.environmentObject(theme)` を最外層に一度つけるだけで、子の `ThemeToggleButton` と `ThemedCard` 両方に自動で届く点が正しく理解できている。

### より良い書き方
`.background(theme.background).ignoresSafeArea()` の順だと背景がセーフエリアまで広がらないことがある。確実に全画面を塗るには:
```swift
.background(theme.background.ignoresSafeArea())
```
または:
```swift
.ignoresSafeArea()
.background(theme.background)
```

# Day25 Review: SwiftUI @State / @Binding

## 課題1: CounterView

### 実装
```swift
HStack {
    Button(action: { count -= 1 }, label: { Text("-") })
    Text("\(count)")
    Button(action: { count += 1 }, label: { Text("+") })
}
```

### より良い書き方
`Button(action:label:)` の明示的な形も正しいが、SwiftUI では trailing closure 形式がより慣用的。

```swift
HStack {
    Button("-") { count -= 1 }
    Text("\(count)")
    Button("+") { count += 1 }
}
```

## 課題2: ToggleFormView

### 実装
```swift
VStack {
    Toggle("通知を受け取る", isOn: $isEnabled)
    Text(isEnabled ? "ON" : "OFF")
}
.padding()
```

### 評価
`$isEnabled` で Binding を正しく渡せている。三項演算子の使い方も簡潔で良い。

## 課題3: StepperChildView

### 実装
```swift
VStack(spacing: 12) {
    Button("タップで +1") { value += 1 }
    Text("現在値: \(value)")
}
```

### 評価
`@Binding` を通じて親の状態を変更するパターンを正しく実装できている。trailing closure 形式も一貫していて読みやすい。

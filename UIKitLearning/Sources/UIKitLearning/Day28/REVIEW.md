# Day28 Review: UIKit UIViewController / UILabel / UIButton

## 課題1: makeNameLabel

```swift
// 実装
@MainActor
func makeNameLabel(name: String) -> UILabel {
    let label = UILabel()
    label.text = name
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.textAlignment = .center
    return label
}
```

**良かった点**: `@MainActor` を自分で付けている。UIKit のオブジェクトは Main Thread (= MainActor) でしか操作できないというルールを理解した上での判断で、正しい。

## 課題2: makeGreetButton

```swift
// 実装
@MainActor
func makeGreetButton() -> UIButton {
    var config = UIButton.Configuration.filled()
    config.title = "挨拶する"
    config.baseBackgroundColor = .systemBlue
    return UIButton(configuration: config)
}
```

**良かった点**: `Configuration` が `struct` なので `var` で受けてから変更している。`let` で受けると mutation できないため、これが正しい書き方。

## 課題3: ProfileViewController

```swift
// 実装
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    nameLabel = makeNameLabel(name: "田中 太郎")
    nameLabel.frame = CGRect(x: 20, y: 120, width: 335, height: 44)

    greetButton = makeGreetButton()
    greetButton.frame = CGRect(x: 20, y: 180, width: 335, height: 44)

    view.addSubview(nameLabel)
    view.addSubview(greetButton)

    greetButton.addTarget(self, action: #selector(greetTapped), for: .touchUpInside)
}

@objc func greetTapped() {
    nameLabel.text = "こんにちは！"
}
```

**良かった点**: `viewDidLoad` の構造が整理されていて読みやすい。「生成 → frame 設定 → addSubview → イベント登録」の流れが一貫している。

**より良い書き方（あれば）**: 各ビューを `lazy var` で宣言しておき、`viewDidLoad` ではレイアウト処理だけに集中するスタイルもある。規模が大きくなるほど見通しがよくなる。

```swift
// 大規模プロジェクト向けの書き方（参考）
private lazy var nameLabel: UILabel = makeNameLabel(name: "田中 太郎")
private lazy var greetButton: UIButton = makeGreetButton()

override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(nameLabel)
    view.addSubview(greetButton)
    nameLabel.frame = CGRect(x: 20, y: 120, width: 335, height: 44)
    greetButton.frame = CGRect(x: 20, y: 180, width: 335, height: 44)
    greetButton.addTarget(self, action: #selector(greetTapped), for: .touchUpInside)
}
```

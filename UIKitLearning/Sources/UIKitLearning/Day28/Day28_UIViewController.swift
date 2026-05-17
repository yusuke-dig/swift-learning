// Day28: UIKit UIViewController / UILabel / UIButton
// テーマ: プログラムでUIパーツを作り、ViewController に載せる

import UIKit

// ─────────────────────────────────────────
// 解説
// ─────────────────────────────────────────
// UIViewController: 画面 1 枚の管理クラス
//   class MyVC: UIViewController { }
//   viewDidLoad() は「ビュー初回生成後」に呼ばれる ← セットアップはここで
//
// UILabel: テキスト表示
//   let label = UILabel()
//   label.text = "こんにちは"
//   label.font = .systemFont(ofSize: 24, weight: .bold)
//   label.textAlignment = .center
//
// UIButton (iOS 15+):
//   var config = UIButton.Configuration.filled()
//   config.title = "タップ"
//   config.baseBackgroundColor = .systemBlue
//   let button = UIButton(configuration: config)
//   button.addTarget(self, action: #selector(メソッド名), for: .touchUpInside)
//
// 最小配置手順:
//   view.addSubview(label)
//   label.frame = CGRect(x: 20, y: 120, width: 335, height: 44)
// ─────────────────────────────────────────

// 課題1: makeNameLabel（易）
// - UILabel を作る
// - text = name をセット
// - font = .systemFont(ofSize: 24, weight: .bold) をセット
// - textAlignment = .center をセット
// - 作った UILabel を返す
@MainActor
func makeNameLabel(name: String) -> UILabel {
    // ここに実装してください
    let label = UILabel()
    label.text = name
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.textAlignment = .center
    return label
}

// 課題2: makeGreetButton（中）
// - UIButton.Configuration.filled() でコンフィグを作る
// - config.title = "挨拶する" をセット
// - config.baseBackgroundColor = .systemBlue をセット
// - UIButton(configuration: config) でボタンを作って返す
@MainActor
func makeGreetButton() -> UIButton {
    // ここに実装してください
    var config = UIButton.Configuration.filled()
    config.title = "挨拶する"
    config.baseBackgroundColor = .systemBlue
    return UIButton(configuration: config)
}

// 課題3: ProfileViewController（中）
// - nameLabel と greetButton を var プロパティとして宣言済み
// - viewDidLoad():
//     view.backgroundColor = .systemBackground
//     nameLabel = makeNameLabel(name: "田中 太郎")
//     nameLabel.frame = CGRect(x: 20, y: 120, width: 335, height: 44)
//     greetButton = makeGreetButton()
//     greetButton.frame = CGRect(x: 20, y: 180, width: 335, height: 44)
//     view に nameLabel / greetButton を addSubview
//     greetButton に #selector(greetTapped) を .touchUpInside で addTarget
// - greetTapped():
//     nameLabel.text = "こんにちは！" に変える
class ProfileViewController: UIViewController {
    var nameLabel: UILabel!
    var greetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // ここに実装してください
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
        // ここに実装してください
        nameLabel.text = "こんにちは！"
    }
}

// ─────────────────────────────────────────
// Preview（Xcode で ⌥⌘Return → Canvas に表示されます）
// ─────────────────────────────────────────
#Preview("プロフィール画面") {
    ProfileViewController()
}

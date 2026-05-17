import Testing
import UIKit
@testable import UIKitLearning

@MainActor
@Suite("Day28: UIKit UIViewController / UILabel / UIButton")
struct Day28Tests {

    @Test("課題1: makeNameLabel がテキストと書式を設定する")
    func testMakeNameLabel() {
        let label = makeNameLabel(name: "田中 太郎")
        #expect(label.text == "田中 太郎")
        #expect(label.textAlignment == .center)
        #expect(label.font == .systemFont(ofSize: 24, weight: .bold))
    }

    @Test("課題1: 別の名前でも正しく設定される")
    func testMakeNameLabelAnotherName() {
        let label = makeNameLabel(name: "山田 花子")
        #expect(label.text == "山田 花子")
    }

    @Test("課題2: makeGreetButton がタイトルと背景色を持つ")
    func testMakeGreetButton() {
        let button = makeGreetButton()
        #expect(button.configuration?.title == "挨拶する")
        #expect(button.configuration?.baseBackgroundColor == .systemBlue)
    }

    @Test("課題3: viewDidLoad 後に nameLabel と greetButton が存在する")
    func testViewDidLoad() {
        let vc = ProfileViewController()
        vc.loadViewIfNeeded()
        #expect(vc.nameLabel != nil)
        #expect(vc.greetButton != nil)
        #expect(vc.nameLabel.text == "田中 太郎")
    }

    @Test("課題3: ボタンタップで nameLabel のテキストが変わる")
    func testGreetTapped() {
        let vc = ProfileViewController()
        vc.loadViewIfNeeded()
        vc.greetButton.sendActions(for: .touchUpInside)
        #expect(vc.nameLabel.text == "こんにちは！")
    }
}

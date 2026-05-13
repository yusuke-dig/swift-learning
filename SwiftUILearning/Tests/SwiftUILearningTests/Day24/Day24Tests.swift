import Testing
import SwiftUI
@testable import SwiftUILearning

// SwiftUIのViewは body の内部をユニットテストで直接検証するのが難しい。
// 実務では「Viewは薄く、ロジックはViewModel」にしてViewModelをテストするのが主流。
// Day24はレイアウトのみなので、「ビューが正しいデータを保持しているか」を検証する。
// 見た目の確認は Xcode の #Preview を使うこと。

@MainActor
@Suite("Day24: SwiftUI View / Text / Stack")
struct Day24Tests {

    @Test("課題1: GreetingView が name を保持している")
    func greetingView() {
        let view = GreetingView(name: "Swift")
        #expect(view.name == "Swift")
    }

    @Test("課題2: ProfileInfoView が name と role を保持している")
    func profileInfoView() {
        let view = ProfileInfoView(name: "山田 太郎", role: "iOSエンジニア")
        #expect(view.name == "山田 太郎")
        #expect(view.role == "iOSエンジニア")
    }

    @Test("課題3: ProfileCardView が name / role / initial を保持している")
    func profileCardView() {
        let view = ProfileCardView(name: "山田 太郎", role: "iOSエンジニア", initial: "山")
        #expect(view.name == "山田 太郎")
        #expect(view.role == "iOSエンジニア")
        #expect(view.initial == "山")
    }
}

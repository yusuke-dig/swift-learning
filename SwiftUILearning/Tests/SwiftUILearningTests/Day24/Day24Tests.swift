import Testing
import SwiftUI
@testable import SwiftUILearning

@Suite("Day24: SwiftUI View / Text / Stack")
struct Day24Tests {

    // 各ビューが View プロトコルを満たしていれば合格
    // 実際の見た目は Xcode の Preview で確認してください

    @Test("課題1: GreetingView が View として使える")
    func greetingView() {
        let view = GreetingView(name: "Swift")
        let _: any View = view
    }

    @Test("課題2: ProfileInfoView が View として使える")
    func profileInfoView() {
        let view = ProfileInfoView(name: "山田 太郎", role: "iOSエンジニア")
        let _: any View = view
    }

    @Test("課題3: ProfileCardView が View として使える")
    func profileCardView() {
        let view = ProfileCardView(name: "山田 太郎", role: "iOSエンジニア", initial: "山")
        let _: any View = view
    }
}

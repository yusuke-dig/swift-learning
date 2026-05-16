# Project Memory

## swift-learning プロジェクト概要
毎日15分でSwift文法を学ぶ自習プロジェクト。
「今日の分をお願い」と言われたら、CLAUDE.md の手順に従って次のDayファイルを作成・コミットする。

## 現在の進捗
| Day | トピック | 状態 |
|-----|---------|------|
| Day01 | 変数と定数 (var/let) | ✅ 完了 (2026-04-19) |
| Day02 | 基本型と型推論 | ✅ 完了 (2026-04-20) |
| Day03 | オプショナル | ✅ 完了 (2026-04-21) |
| Day04 | コレクション | ✅ 完了 (2026-04-23) |
| Day05 | 制御構文 | ✅ 完了 (2026-04-24) |
| Day06 | 関数 | ✅ 完了 (2026-04-26) |
| Day07 | クロージャ | ✅ 完了 (2026-04-26) |
| Day08 | 構造体 | ✅ 完了 (2026-04-27) |
| Day09 | クラスと継承 | ✅ 完了 (2026-04-28) |
| Day10 | プロトコル | ✅ 完了 (2026-04-29) |
| Day11 | エラー処理 | ✅ 完了 (2026-04-30) |
| Day12 | 列挙型 | ✅ 完了 (2026-05-01) |
| Day13 | 高階関数 | ✅ 完了 (2026-05-02) |
| Day14 | ジェネリクス | ✅ 完了 (2026-05-03) |
| Day15 | 非同期処理 | ✅ 完了 (2026-05-04) |
| Day16 | Equatable / Comparable / Hashable | ✅ 完了 (2026-05-05) |
| Day17 | Codable (JSON) | ✅ 完了 (2026-05-06) |
| Day18 | some / any (不透明型・存在型) | ✅ 完了 (2026-05-07) |
| Day19 | Result<T, E> 型 | ✅ 完了 (2026-05-08) |
| Day20 | @propertyWrapper | ✅ 完了 (2026-05-09) |
| Day21 | @Observable / ObservableObject | ✅ 完了 (2026-05-10) |
| Day22 | Combine 入門 | ✅ 完了 (2026-05-11) |
| Day23 | Actor / Sendable | ✅ 完了 (2026-05-12) |
| Day24 | SwiftUI: View / Text / Stack | ✅ 完了 (2026-05-13) |
| Day25 | SwiftUI: @State / @Binding | ✅ 完了 (2026-05-14) |
| Day26 | SwiftUI: List / ForEach / Navigation | ✅ 完了 (2026-05-15) |
| Day27 | SwiftUI: @Environment / @EnvironmentObject | ⬜ 未完了 |
| Day28 | UIKit: UIViewController / UILabel / UIButton | ⬜ 未着手 |
| Day29 | UIKit: Auto Layout | ⬜ 未着手 |
| Day30 | UIKit: UITableView | ⬜ 未着手 |
| Day31 | UIKit: UINavigationController | ⬜ 未着手 |
| Day32 | TCA 入門: Store / State / Action / Reducer | ⬜ 未着手 |
| Day33 | TCA: Effect / async | ⬜ 未着手 |
| Day34 | TCA: Dependency / テスト | ⬜ 未着手 |
| Day35 | TCA: 画面遷移 / StackState | ⬜ 未着手 |

次に作るのは **Day28: UIKit: UIViewController / UILabel / UIButton**。

## ディレクトリ構成
- Day01〜Day23: `Sources/SwiftLearning/DayXX/`（SPM、swift testで完結）
- Day24〜Day28: `SwiftUILearning/`（Xcodeプロジェクト、Day24到達時に作成）
- Day29〜Day32: `UIKitLearning/`（Xcodeプロジェクト、Day29到達時に作成）

## 関連ディレクトリ
- 実装: `Sources/SwiftLearning/DayXX/`
- テスト: `Tests/SwiftLearningTests/DayXX/`
- 学習ログ: `../dev-learning-logs/logs/swift/`

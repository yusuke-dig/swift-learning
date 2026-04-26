# Swift Learning Project

## このプロジェクトについて
毎日15分のSwift文法学習プロジェクト。
「今日の分をお願い」と言われたら、次のDayを自動で作成・コミットする。

> **セッション開始時に必ず `MEMORY.md` を読み、現在の進捗を確認すること。**

## 「今日の分をお願い」と言われたときの手順

1. `Sources/SwiftLearning/` の中で最も大きい Day番号を確認する
2. 次の番号のDayを決定する (例: Day01があれば Day02を作る)
3. カリキュラムに従って実装テンプレートとテストを作成する
4. 以下のファイルを作成する:
   - `Sources/SwiftLearning/DayXX/DayXX_{TopicName}.swift` (実装テンプレート)
   - `Tests/SwiftLearningTests/DayXX/DayXXTests.swift` (テスト)
5. `README.md` の進捗表で該当Dayを `⬜ 未着手` → `⬜ 未完了` に更新する
6. `swift build 2>&1` を実行してコンパイルエラーになることを確認する（RED確認）
7. git add して適切なメッセージでコミットする

## 1日15分の時間配分

| フェーズ | 時間 | 内容 |
|---------|------|------|
| 読む | 5分 | 解説コメントと例を読む |
| 実装 | 8分 | 3つの関数を実装する |
| テスト | 2分 | `swift test` を実行して確認 |

## ファイルの書き方ルール

### 実装テンプレート (Sources側)
- 解説コメントは **5分以内で読める量** に抑える（長くなるなら削る）
- コード例は2〜3行のシンプルなものだけ示す
- 課題は **3つ**（難易度: 易→中→中）
- 各関数は **2〜4行で実装できる** 難易度にする（アルゴリズム問題にしない）
- 関数本体は `// ここに実装してください` のみ

### テスト (Tests側)
- `import Testing` と `@testable import SwiftLearning` を使う
- `@Suite("DayXX: トピック名")` でスイートを作る
- 各課題に対して `@Test` を1つ、複数の `#expect` でカバー
- 境界値・ネガティブケースも含める

## カリキュラム

| Day | トピック | 関数テーマ例 |
|-----|---------|------------|
| Day01 | 変数と定数 (var/let) | greet, add, isEven |
| Day02 | 基本型と型推論 (Int/String/Bool/Double) | celsiusToFahrenheit, isLongWord, absolute |
| Day03 | オプショナル (Optional/if let/guard let) | safeDivide, firstElement, parseAge |
| Day04 | コレクション (Array/Dictionary) | sum, countOccurrences, mostFrequent |
| Day05 | 制御構文 (if/switch/for-in) | grade, fizzBuzz, factorial |
| Day06 | 関数 (引数ラベル/デフォルト値/inout) | repeat, swap, clamp |
| Day07 | クロージャ | applyTwice, myFilter, myMap |
| Day08 | 構造体 (struct) | Point距離計算, Rectangle面積, Stack |
| Day09 | クラスと継承 | Shape/Circle/Rectangle |
| Day10 | プロトコル | Describable, Comparable実装 |
| Day11 | エラー処理 (throw/try/catch) | parseTemperature, safeSqrt |
| Day12 | 列挙型 (enum/associated values) | Direction, Result風enum |
| Day13 | 高階関数 (map/filter/reduce) | doubleAll, onlyEven, sumAll |
| Day14 | ジェネリクス | Stack<T>, findFirst |
| Day15 | 非同期処理 (async/await) | fetchMessage, parallelFetch |

## テスト合格を確認したとき
- **`git status` で未コミットの変更がないか確認する**
  - `Sources/SwiftLearning/DayXX/DayXX_{TopicName}.swift`（ユーザーの実装）がコミット漏れていないか必ずチェック
  - 未コミットなら REVIEW.md・README.md と一緒に、または先にコミットする
- 実装コードをレビューして `README.md` の `## レビュー記録` に `### DayXX Review` セクションを追加する
  - `Sources/SwiftLearning/DayXX/REVIEW.md` を作成する
  - 各課題ごとに「実装」と「より良い書き方（あれば）」をコードブロックで示す
  - 改善点がない場合も「良かった点」を必ず書く
  - 進捗表の該当Dayのメモ列に `[レビュー](Sources/SwiftLearning/DayXX/REVIEW.md)` リンクを追加する
- `README.md` の該当Dayを `✅ 完了` に更新し、完了日を記入してコミットする
- コミットメッセージ: `Complete Day{XX}: {トピック名}`
- `../dev-learning-logs/` に学習ログを書く（下記「dev-learning-logs 連携」参照）

## dev-learning-logs 連携

テスト合格後、`../dev-learning-logs/` にも学習ログを書くこと。

### 手順

1. `../dev-learning-logs/logs/swift/YYYY-MM-DD.md` を作成する
   - YYYY-MM-DD は **`date +%Y-%m-%d` で取得した実際の日付**（セッション開始時刻ではなく、作業した時点の日付）
   - 同日に既存ファイルがあっても、上書きせず **別ファイルを作らない**。その日のログに追記する形にする
   - 記法・粒度は `../dev-learning-logs/CLAUDE.md` の規約に従う
   - 構成: 今日の作業内容 / 今日学んだこと（トピックごとに見出しを分ける）
2. `../dev-learning-logs/README.md` の `## Swift` セクションに1行追加する
   - 形式: `- [YYYY-MM-DD](logs/swift/YYYY-MM-DD.md) 今日のトピック要約`
3. `../dev-learning-logs/` でコミットする：
   ```
   cd ../dev-learning-logs
   git add logs/swift/YYYY-MM-DD.md README.md
   git commit -m "Swift Day{XX}: {トピック名}"
   cd -
   ```

## 進捗の状態定義
| 状態 | 意味 |
|------|------|
| ⬜ 未着手 | ファイル未作成 |
| ⬜ 未完了 | ファイル作成済み・実装中 |
| ✅ 完了 | 全テスト合格 |

## コミットメッセージ形式
```
Add Day{XX}: {日本語トピック名}

- {実装テンプレートファイル名}
- {テストファイル名}
```

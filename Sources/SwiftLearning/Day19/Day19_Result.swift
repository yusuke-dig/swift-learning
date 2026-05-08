// Day19: Result<T, E> 型
//
// Result<Success, Failure> は「成功か失敗か」を型で表す列挙型。
// Optional と違い、失敗の理由（エラー値）を保持できる。
//
// 基本形:
//   enum Result<Success, Failure: Error> {
//     case success(Success)
//     case failure(Failure)
//   }
//
// 使い方:
//   func divide(_ a: Int, _ b: Int) -> Result<Int, DivisionError> {
//     guard b != 0 else { return .failure(.divisionByZero) }
//     return .success(a / b)
//   }
//
//   switch divide(10, 2) {
//   case .success(let v): print(v)        // 5
//   case .failure(let e): print(e)
//   }
//
// get() で成功値を取り出す（失敗なら throw）:
//   let value = try divide(10, 2).get()   // 5
//
// map / flatMap でチェーンもできる:
//   let doubled = divide(10, 2).map { $0 * 2 }  // .success(10)

// ---- エラー型 ----

enum ScoreError: Error, Equatable {
    case outOfRange   // 0〜100 の範囲外
    case notANumber   // 数値に変換できない文字列
}

enum FetchError: Error, Equatable {
    case notFound     // IDに対応するデータなし
    case unauthorized // アクセス権なし
}

// ---- 課題 1 ----
// 文字列を受け取り、0〜100 の整数スコアに変換して返す。
// 変換できない場合は .notANumber、範囲外は .outOfRange を返す。
func parseScore(_ input: String) -> Result<Int, ScoreError> {
    // ここに実装してください
    guard let score = Int(input) else { return .failure(.notANumber) }
    guard (0...100).contains(score) else { return .failure(.outOfRange) }
    return .success(score)
}

// ---- 課題 2 ----
// IDと辞書（データストア）を受け取り、対応する値を返す。
// IDが見つからなければ .notFound を返す。
// IDが "secret" の場合は .unauthorized を返す。
func safeFetch(id: String, from store: [String: String]) -> Result<String, FetchError> {
    // ここに実装してください
    if id == "secret" { return .failure(.unauthorized) }
    guard let value = store[id] else { return .failure(.notFound) }
    return .success(value)
}

// ---- 課題 3 ----
// parseScore と safeFetch を組み合わせる。
// store から id に対応する文字列を取得し、スコアに変換して返す。
// どちらかが失敗したら、その失敗を表す文字列（エラー名）を返す。
// 成功なら "OK: {score}" の形式で返す。
//
// ヒント: switch や map/flatMap は使わず、get() + do-catch でも書ける
func fetchAndParseScore(id: String, from store: [String: String]) -> String {
    // ここに実装してください
    do {
        let safeValue = try safeFetch(id: id, from: store).get()
        let score = try parseScore(safeValue).get()
        return "OK: \(score)"
    } catch let err as ScoreError {
        return "\(err)"
    } catch let err as FetchError {
        return "\(err)"
    } catch {
        return "unknown error"
    }
}

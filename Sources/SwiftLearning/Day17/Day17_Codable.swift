// Day17: Codable (JSON)
//
// Codable = Encodable + Decodable を合わせたプロトコル。
// 構造体・クラスに準拠するだけで JSON との相互変換が可能になる。
//
// --- 基本の使い方 ---
// struct User: Codable {
//     let id: Int
//     let name: String
// }
//
// // エンコード (Swift → JSON)
// let user = User(id: 1, name: "Alice")
// let data = try JSONEncoder().encode(user)         // Data型
// let json = String(data: data, encoding: .utf8)!   // JSONテキスト
//
// // デコード (JSON → Swift)
// let decoded = try JSONDecoder().decode(User.self, from: data)
//
// --- キー名を変換したい場合 ---
// encoder.keyEncodingStrategy  = .convertToSnakeCase  // firstName → first_name
// decoder.keyDecodingStrategy  = .convertFromSnakeCase
//
// --- CodingKeys で個別に指定する場合 ---
// enum CodingKeys: String, CodingKey {
//     case userId = "user_id"
//     case name
// }

import Foundation

// MARK: - 使用する型定義（変更不要）

struct User: Codable, Equatable {
    let id: Int
    let name: String
    let email: String
}

struct Product: Codable, Equatable {
    let productId: Int
    let productName: String
    let price: Double
}

// MARK: - 課題1: User をエンコードして JSON 文字列を返す
// ヒント: JSONEncoder().encode() → Data → String(data:encoding:)
func encodeUser(_ user: User) throws -> String {
    // ここに実装してください
}

// MARK: - 課題2: JSON 文字列から User をデコードして返す
// ヒント: JSONDecoder().decode(User.self, from: data)
func decodeUser(from json: String) throws -> User {
    // ここに実装してください
}

// MARK: - 課題3: Product を snakeCase の JSON にエンコードして返す
// ヒント: encoder.keyEncodingStrategy = .convertToSnakeCase を設定する
// 結果例: {"product_id":1,"product_name":"Swift Book","price":2980.0}
func encodeProductAsSnakeCase(_ product: Product) throws -> String {
    // ここに実装してください
}

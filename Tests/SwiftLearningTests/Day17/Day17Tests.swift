import Testing
@testable import SwiftLearning
import Foundation

@Suite("Day17: Codable (JSON)")
struct Day17Tests {

    // MARK: - 課題1: encodeUser

    @Test("encodeUser: 正常なユーザーを JSON 文字列に変換できる")
    func testEncodeUser() throws {
        let user = User(id: 1, name: "Alice", email: "alice@example.com")
        let json = try encodeUser(user)

        // JSON として再パースして検証（キー順序に依存しない）
        let data = json.data(using: .utf8)!
        let decoded = try JSONDecoder().decode(User.self, from: data)
        #expect(decoded.id == 1)
        #expect(decoded.name == "Alice")
        #expect(decoded.email == "alice@example.com")
    }

    @Test("encodeUser: id=0 や空文字列も正しくエンコードできる")
    func testEncodeUserEdgeCases() throws {
        let user = User(id: 0, name: "", email: "")
        let json = try encodeUser(user)

        let data = json.data(using: .utf8)!
        let decoded = try JSONDecoder().decode(User.self, from: data)
        #expect(decoded.id == 0)
        #expect(decoded.name == "")
    }

    // MARK: - 課題2: decodeUser

    @Test("decodeUser: 正常な JSON から User を復元できる")
    func testDecodeUser() throws {
        let json = """
        {"id":42,"name":"Bob","email":"bob@example.com"}
        """
        let user = try decodeUser(from: json)
        #expect(user.id == 42)
        #expect(user.name == "Bob")
        #expect(user.email == "bob@example.com")
    }

    @Test("decodeUser: 不正な JSON は DecodingError をスローする")
    func testDecodeUserInvalidJSON() {
        let invalid = "not a json"
        #expect(throws: (any Error).self) {
            try decodeUser(from: invalid)
        }
    }

    @Test("decodeUser: フィールド欠落は DecodingError をスローする")
    func testDecodeUserMissingField() {
        let incomplete = """
        {"id":1,"name":"Alice"}
        """
        #expect(throws: (any Error).self) {
            try decodeUser(from: incomplete)
        }
    }

    // MARK: - 課題3: encodeProductAsSnakeCase

    @Test("encodeProductAsSnakeCase: キーが snakeCase に変換される")
    func testEncodeProductAsSnakeCase() throws {
        let product = Product(productId: 10, productName: "Swift Book", price: 2980.0)
        let json = try encodeProductAsSnakeCase(product)

        // snakeCase キーで手動デコード
        let data = json.data(using: .utf8)!
        let dict = try JSONSerialization.jsonObject(with: data) as! [String: Any]
        #expect(dict["product_id"] as? Int == 10)
        #expect(dict["product_name"] as? String == "Swift Book")
        #expect(dict["price"] as? Double == 2980.0)
        // camelCase キーが含まれないことも確認
        #expect(dict["productId"] == nil)
        #expect(dict["productName"] == nil)
    }

    @Test("encodeProductAsSnakeCase: price が小数でも正しくエンコードされる")
    func testEncodeProductPrice() throws {
        let product = Product(productId: 99, productName: "Keyboard", price: 12345.67)
        let json = try encodeProductAsSnakeCase(product)

        let data = json.data(using: .utf8)!
        let dict = try JSONSerialization.jsonObject(with: data) as! [String: Any]
        #expect(dict["product_id"] as? Int == 99)
        let price = dict["price"] as? Double ?? 0
        #expect(abs(price - 12345.67) < 0.001)
    }
}

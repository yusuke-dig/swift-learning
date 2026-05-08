import Testing
@testable import SwiftLearning

@Suite("Day19: Result<T, E> 型")
struct Day19Tests {

    // ---- parseScore ----
    @Test("parseScore: 正常値")
    func testParseScoreValid() {
        #expect(parseScore("0")   == .success(0))
        #expect(parseScore("100") == .success(100))
        #expect(parseScore("50")  == .success(50))
    }

    @Test("parseScore: 範囲外")
    func testParseScoreOutOfRange() {
        #expect(parseScore("-1")  == .failure(.outOfRange))
        #expect(parseScore("101") == .failure(.outOfRange))
        #expect(parseScore("999") == .failure(.outOfRange))
    }

    @Test("parseScore: 数値以外")
    func testParseScoreNotANumber() {
        #expect(parseScore("abc") == .failure(.notANumber))
        #expect(parseScore("")    == .failure(.notANumber))
        #expect(parseScore("1.5") == .failure(.notANumber))
    }

    // ---- safeFetch ----
    @Test("safeFetch: 正常取得")
    func testSafeFetchFound() {
        let store = ["user1": "Alice", "user2": "Bob"]
        #expect(safeFetch(id: "user1", from: store) == .success("Alice"))
        #expect(safeFetch(id: "user2", from: store) == .success("Bob"))
    }

    @Test("safeFetch: 未発見")
    func testSafeFetchNotFound() {
        let store = ["user1": "Alice"]
        #expect(safeFetch(id: "user9", from: store) == .failure(.notFound))
    }

    @Test("safeFetch: unauthorized")
    func testSafeFetchUnauthorized() {
        let store = ["secret": "hidden"]
        #expect(safeFetch(id: "secret", from: store) == .failure(.unauthorized))
    }

    // ---- fetchAndParseScore ----
    @Test("fetchAndParseScore: 成功")
    func testFetchAndParseSuccess() {
        let store = ["s1": "85", "s2": "0", "s3": "100"]
        #expect(fetchAndParseScore(id: "s1", from: store) == "OK: 85")
        #expect(fetchAndParseScore(id: "s2", from: store) == "OK: 0")
        #expect(fetchAndParseScore(id: "s3", from: store) == "OK: 100")
    }

    @Test("fetchAndParseScore: Fetch失敗")
    func testFetchAndParseFetchError() {
        let store = ["s1": "85"]
        let result = fetchAndParseScore(id: "unknown", from: store)
        #expect(result.contains("notFound"))
    }

    @Test("fetchAndParseScore: Parse失敗")
    func testFetchAndParseParseError() {
        let store = ["s1": "abc", "s2": "200"]
        #expect(fetchAndParseScore(id: "s1", from: store).contains("notANumber"))
        #expect(fetchAndParseScore(id: "s2", from: store).contains("outOfRange"))
    }
}

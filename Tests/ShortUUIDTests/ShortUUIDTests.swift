import XCTest
@testable import ShortUUID

final class ShortUUIDTests: XCTestCase {
    
    let b58 = ShortUUID()
    let b90 = ShortUUID(toAlphabet: ShortUUID.cookieBase90)
    
    func test_default_alpabet_is_b58() {
        XCTAssertEqual(b58.alphabet, ShortUUID.flickrBase58)
    }
    
    func test_set_alphabet_to_b90() {
        XCTAssertEqual(b90.alphabet, ShortUUID.cookieBase90)
    }
    
    func test_create_shortId_is_not_nil() {
        let shortId = b58.generate()
        XCTAssertNotNil(shortId)
    }
    
    func test_create_shortId_is_not_empty() {
        let shortId = b58.generate()
        XCTAssertFalse(shortId.isEmpty)
    }
    
    func test_create_uuid_from_shortId() {
        let uuid = b58.toUUID("mhvXdrZT4jP5T8vBxuvm75")
        XCTAssertEqual(uuid?.description, "A44521D0-0FB8-4ADE-8002-3385545C3318")
    }
    
    func test_create_shortId_from_uuid() {
        let shortId = b58.fromUUID(UUID(uuidString: "a44521d0-0fb8-4ade-8002-3385545c3318")!)
        XCTAssertEqual(shortId, "mhvXdrZT4jP5T8vBxuvm75")
    }
    
    func test_translate_back_b58() {
        let originalUUID = UUID()
        let shortId = b58.fromUUID(originalUUID)
        let uuid = b58.toUUID(shortId)
        XCTAssertEqual(uuid, originalUUID)
    }
    
    func test_translate_back_b90() {
        let originalUUID = UUID()
        let shortId = b90.fromUUID(originalUUID)
        let uuid = b90.toUUID(shortId)
        XCTAssertEqual(uuid, originalUUID)
    }
    
    func test_handle_uuid_with_leading_zeros_b58() {
        let originalUUID = UUID(uuidString: "00000000-a70c-4ebd-8f2b-540f7e709092")!
        let shortId = b58.fromUUID(originalUUID)
        let uuid = b58.toUUID(shortId)
        XCTAssertEqual(uuid, originalUUID)
    }
    
    func test_handle_uuid_with_leading_zeros_b90() {
        let originalUUID = UUID(uuidString: "00000000-a70c-4ebd-8f2b-540f7e709092")!
        let shortId = b90.fromUUID(originalUUID)
        let uuid = b90.toUUID(shortId)
        XCTAssertEqual(uuid, originalUUID)
    }
    
    func test_handle_uuid_with_all_zeros_b58() {
        let originalUUID = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
        let shortId = b58.fromUUID(originalUUID)
        let uuid = b58.toUUID(shortId)
        XCTAssertEqual(uuid, originalUUID)
    }
    
    func test_handle_uuid_with_all_zeros_b90() {
        let originalUUID = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
        let shortId = b90.fromUUID(originalUUID)
        let uuid = b90.toUUID(shortId)
        XCTAssertEqual(uuid, originalUUID)
    }
    
    static var allTests = [
        ("test_default_alpabet_is_b58", test_default_alpabet_is_b58),
        ("test_set_alphabet_to_b90", test_set_alphabet_to_b90),
        ("test_create_shortId_is_not_nil", test_create_shortId_is_not_nil),
        ("test_create_shortId_is_not_empty", test_create_shortId_is_not_empty),
        ("test_create_uuid_from_shortId", test_create_uuid_from_shortId),
        ("test_create_shortId_from_uuid", test_create_shortId_from_uuid),
        ("test_translate_back_b58", test_translate_back_b58),
        ("test_translate_back_b90", test_translate_back_b90),
        ("test_handle_uuid_with_leading_zeros_b58", test_handle_uuid_with_leading_zeros_b58),
        ("test_handle_uuid_with_leading_zeros_b90", test_handle_uuid_with_leading_zeros_b90),
        ("test_handle_uuid_with_all_zeros_b58", test_handle_uuid_with_all_zeros_b58),
        ("test_handle_uuid_with_all_zeros_b90", test_handle_uuid_with_all_zeros_b90)
    ]
}

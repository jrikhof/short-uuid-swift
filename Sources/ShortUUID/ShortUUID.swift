import Foundation
import AnyBase

public final class ShortUUID {
    
    public static let flickrBase58 = "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
    public static let cookieBase90 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!#$%&'()*+-./:<=>?@[]^_`{|}~"
    
    public let alphabet: String
    
    public init(toAlphabet alphabet: String = flickrBase58) {
        self.alphabet = alphabet
    }
    
    public func generate() -> String {
        return fromUUID(UUID())
    }
    
    public func toUUID(_ shortId: String) -> UUID? {
        let uu1: String
        do {
            let toHex = try AnyBase(alphabet, AnyBase.HEX)
            uu1 = try toHex.convert(shortId)
        } catch {
            return nil
        }

        var leftPad = ""
        let len = uu1.count
        // Pad out UUIDs beginning with zeros (any number shorter than 32 characters of hex)
        if len < 32 {
            (0..<32-len).forEach { _ in leftPad += "0" }
        }
        
        return UUID(uuidString: (leftPad + uu1).withUUIDHyphens())
    }
    
    public func fromUUID(_ uuid: UUID) -> String {
        guard let fromHex = try? AnyBase(AnyBase.HEX, alphabet),
            let shortId = try? fromHex.convert(uuid.uuidString.lowercased().replacingOccurrences(of: "-", with: "")) else {
            return uuid.uuidString
        }
        return shortId
    }
}

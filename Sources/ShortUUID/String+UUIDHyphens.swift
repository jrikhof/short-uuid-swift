import Foundation

extension String {
    
    func withUUIDHyphens() -> String {
        guard !contains("-"), count == 32 else {
            return self
        }

        let pattern = #"(\w{8})(\w{4})(\w{4})(\w{4})(\w{12})"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: self.utf16.count)
        let matches = regex.matches(in: self, options: [], range: range)

        guard let match = matches.first else {
            return self
        }

        var parts: [String] = []
        for i in 1..<match.numberOfRanges {
            if let range = Range(match.range(at: i), in: self) {
                parts.append(self[range].description)
            }
        }
        return parts.joined(separator: "-")
    }
}

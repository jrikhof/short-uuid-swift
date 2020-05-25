# ShortUUID

This is a Swift implementation of Samuel Rouse's [short-uuid](https://github.com/oculus42/short-uuid) npm package.

## Details ##

short-uuid starts with RFC4122 v4-compliant UUIDs and translates them into other, usually shorter formats. It also provides translators to convert back and forth from RFC complaint UUIDs to the shorter formats.

## Example ##

```swift
let translator = ShortUUID()
let shortId = translator.generate()  // eGQRS1nM2t3E8xxcc2BhjA

// Translate UUIDs to and from the shortened format
translator.toUUID(shortId) // a44521d0-0fb8-4ade-8002-3385545c3318
translator.fromUUID(UUID(uuidString: "a44521d0-0fb8-4ade-8002-3385545c3318")!) // mhvXdrZT4jP5T8vBxuvm75

// See the alphabet used by a translator
translator.alphabet

// View the constants
ShortUUID.flickrBase58 // Avoids similar characters (0/O, 1/I/l, etc.)
ShortUUID.cookieBase90 // Safe for HTTP cookies values for smaller IDs.
```

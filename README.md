# SwiftSugar

Useful extensions and utils for Swift development


# Bool

```Swift
func assertTrue() -> Bool
func assertFalse() -> Bool

var isTrue: Bool
var isFalse: Bool


func ifTrue(_ success: () throws -> Void) rethrows
func ifFalse(_ failure: () throws -> Void) rethrows
func ifFalseOrNil(_ failure: () throws -> Void) rethrows

// Optional Bool
func ifTrue(_ success: () throws -> Void) rethrows
func ifFalse(_ failure: () throws -> Void) rethrows
func ifFalseOrNil(_ failure: () throws -> Void) rethrows
```

# Collection
```Swift
var isNotEmpty: Bool
var hasContent: Bool

```

# Int
```Swift
func times(_ work: () throws -> Void) rethrows
func enumerate(_ work: (Int) throws -> Void) rethrows

```

# OnceSugar
```Swift
public init(threadSafe: Bool = false)
public func onceOnly(_ task: () throws -> Void) rethrows
```

# Optional
```Swift
func ifNotNil<U>(_ block: (Wrapped) throws -> U) rethrows -> U?
var isNil: Bool
var isNotNil: Bool

```

# Sequence
```Swift
func componentsJoined(by seperator: String = ",") -> String
```

# URL
```Swift
/// The working directory of the current process.
/// Calling this property will issue a `getcwd` syscall.
public static func currentDirectory() -> URL

/// The home directory for the current user (~/).
/// Complexity: O(1)
public static var homeDirectory: URL { get }

/// The temporary directory for the current user.
/// Complexity: O(1)
public static var temporaryDirectory: URL { get }

/// Discardable cache files directory for the
/// current user. (~/Library/Caches).
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var cachesDirectory: URL { get }

/// Supported applications (/Applications).
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var applicationDirectory: URL { get }

/// Various user-visible documentation, support, and configuration
/// files for the current user (~/Library).
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var libraryDirectory: URL { get }

/// User home directories (/Users).
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var userDirectory: URL { get }

/// Documents directory for the current user (~/Documents)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var documentsDirectory: URL { get }

/// Desktop directory for the current user (~/Desktop)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var desktopDirectory: URL { get }

/// Application support files for the current
/// user (~/Library/Application Support)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var applicationSupportDirectory: URL { get }

/// Downloads directory for the current user (~/Downloads)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var downloadsDirectory: URL { get }

/// Movies directory for the current user (~/Movies)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var moviesDirectory: URL { get }

/// Music directory for the current user (~/Music)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var musicDirectory: URL { get }

/// Pictures directory for the current user (~/Pictures)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var picturesDirectory: URL { get }

/// The user’s Public sharing directory (~/Public)
/// Complexity: O(n) where n is the number of significant directories
/// specified by `FileManager.SearchPathDirectory`
public static var sharedPublicDirectory: URL { get }

/// Returns the home directory for the specified user.
public static func homeDirectory(forUser user: String) -> URL?

/// -URLForDirectory:inDomain:appropriateForURL:create:error: is a URL-based replacement for FSFindFolder(). It allows for the specification and (optional) creation of a specific directory for a particular purpose (e.g. the replacement of a particular item on disk, or a particular Library directory.
/// You may pass only one of the values from the NSSearchPathDomainMask enumeration, and you may not pass NSAllDomainsMask.
public static func getUrl(for directory: FileManager.SearchPathDirectory, in domain: FileManager.SearchPathDomainMask = .userDomainMask, appropriateFor url: URL? = nil, create shouldCreate: Bool = false) throws -> URL
```

# StringConvertible
```
func printed()
```




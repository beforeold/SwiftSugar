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

# StringConvertible
```
func printed()
```




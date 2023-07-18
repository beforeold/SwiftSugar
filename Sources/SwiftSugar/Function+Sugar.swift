//
//  Function+Sugar.swift
//  
//
//  Created by beforeold on 2022/11/14.
//

import Foundation

@inlinable
public func itself<T>(_ value: T) -> T {
  value
}

@inlinable
public func returnTrue<T>(_ value: T) -> Bool {
  true
}

@inlinable
public func returnFalse<T>(_ value: T) -> Bool {
  false
}

@inlinable
public func keepLeft<T>(_ left: T, _ right: T) -> T {
  return left
}

@inlinable
public func keepRight<T>(_ left: T, _ right: T) -> T {
  return right
}

@inlinable
public func calculatePercentage(_ numerator: Int, _ denominator: Int) -> Int {
  guard denominator != 0 else {
    return 0
  }
  return numerator * 100 / denominator
}

/// to string or return emtpy string
@inlinable
public func toString<T>(_ value: T?) -> String {
  if let value = value {
    return "\(value)"
  }
  return ""
}

public func clamp<T: Comparable>(_ minValue: T, _ value: T, _ maxValue: T) -> T {
    return max(minValue, min(value, maxValue))
}


public typealias CompletionHandler = () -> Void

@inlinable
public func emptyFunction() { }

@inlinable
public func emptyFunction<A0>(_ arg0: A0) { }

@inlinable
public func emptyFunction<A0, A1>(_ arg0: A0, _ arg1: A1) { }

@inlinable
public func emptyFunction<A0, A1, A2>(_ arg0: A0, _ arg1: A1, _ arg2: A2) { }

@inlinable
public func emptyFunction<A0, A1, A2, A3>(_ arg0: A0, _ arg1: A1, _ arg2: A2, _ arg3: A3) { }

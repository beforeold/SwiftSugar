//
//  Int+Sugar.swift
//
//
//  Created by beforeold on 2022/8/20.
//


public extension Int {
  func times(_ work: () throws -> Void) rethrows {
    for _ in 0..<self {
      try work()
    }
  }
  
  func enumerate(_ work: (Int) throws -> Void) rethrows {
    for i in 0..<self {
      try work(i)
    }
  }
}

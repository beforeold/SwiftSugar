//
//  Data+Sugar.swift
//  
//
//  Created by beforeold on 2022/10/12.
//

import Foundation



extension Data: SugarCompatible { }

// refer to: https://www.objc.io/blog/2018/02/13/string-to-data-and-back/
extension Sugar where Base == Data {
  public var utf8String: String? {
    return String(data: base, encoding: .utf8)
  }
  
  public var fixableUtf8String: String {
    return String(decoding: base, as: UTF8.self)
  }
}

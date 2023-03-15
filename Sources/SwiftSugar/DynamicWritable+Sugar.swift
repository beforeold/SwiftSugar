//
//  DynamicWritable+Sugar.swift
//  
//
//  Created by beforeold on 2022/11/22.
//

import Foundation

public protocol DynamicWritable: AnyObject { }

private var private_map_key: String? = nil

extension DynamicWritable {
  fileprivate var map: [String: Any] {
    get {
      let map = objc_getAssociatedObject(self, &private_map_key) as? [String: Any]
      return map ?? [:]
    }
    
    set {
      objc_setAssociatedObject(self, &private_map_key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}

extension Sugar where Base: DynamicWritable {
  public func set<T>(value: T?, forKey key: String) {
    base.map[key] = value
  }
  
  public func set<T: AnyObject>(weakValue: T, forKey key: String) {
    base.map[key] = AnyWeakBox(weakValue)
  }
  
  public func getValue<T>(forKey key: String) -> T? {
    let value = base.map[key]
    if let weakBox = value as? AnyWeakBox {
      return weakBox.value as? T
    }
    
    return value as? T
  }
}


extension NSObject: DynamicWritable { }

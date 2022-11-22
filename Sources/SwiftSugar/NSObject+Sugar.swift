//
//  NSObject+Sugar.swift
//  
//
//  Created by beforeold on 2022/11/22.
//

import Foundation

public protocol DynamicSavable: AnyObject {
  
}

private var private_map_key: String? = nil

extension DynamicSavable {
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

extension Sugar where Base: DynamicSavable {
  public func set<T>(value: T?, forKey key: String) {
    base.map[key] = value
  }
  
  public func set<T: AnyObject>(weakValue: T, forKey key: String) {
    base.map[key] = SugarAnoymousWeakBox(weakValue)
  }
  
  public func getValue<T>(forKey key: String) -> T? {
    let value = base.map[key]
    if let weakBox = value as? SugarAnoymousWeakBox {
      return weakBox.value as? T
    }
    
    return value as? T
  }
}


extension NSObject: DynamicSavable { }

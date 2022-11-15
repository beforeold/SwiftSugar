//
//  CallbackSugar.swift
//  SwiftSugar
//
//  Created by beforeold on 2022/11/12.
//

import Foundation

/// a callback wrapper which handle lifecycle by itself
open class CallbackSugar<Value> {
  private var internalCallback: (Value) -> Void = { _ in }
  
  public init(callback: @escaping (Value) -> Void) {
    let inputCallback = callback
    
    self.internalCallback = { value in
      inputCallback(value)
      
      // retain self in internalCallback at initializer
      // clear to break retain cycle when callback is invoked
      self.clear()
    }
  }
  
  // invoke this once to callback the input callback
  open func callback(_ value: Value) {
    internalCallback(value)
  }
  
  // clear the interal callback to break retain cycle
  private func clear() {
    self.internalCallback = { _ in }
  }
}

//
//  Binding+Sugar.swift
//  
//
//  Created by beforeold on 2022/11/12.
//

import SwiftUI

@available(iOS 13.0, *)
extension Binding {
  public func presence<T>() -> Binding<Bool> where Value == Optional<T> {
    return .init {
      self.wrappedValue != nil
    } set: { newValue in
      /*
      precondition(newValue == false)
      self.wrappedValue = nil
      */
      // ignore set closure
    }
  }
}

//
//  View+Sugar.swift
//  
//
//  Created by beforeold on 2022/10/28.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension View {
  @ViewBuilder
  func ifCondition<T, F>(_ condition: Bool,
                         @ViewBuilder trueReturn trueTransform: (Self) -> T,
                         @ViewBuilder elseReturn falseTransform: (Self) -> F) -> some View
  where T: View, F: View {
    if condition {
      trueTransform(self)
    } else {
      falseTransform(self)
    }
  }
  
  @ViewBuilder
  func ifCondition<T>(_ condition: Bool,
                      @ViewBuilder trueReturn trueTransform: (Self) -> T) -> some View
  where T: View {
    if condition {
      trueTransform(self)
    } else {
      self
    }
  }
  
  @ViewBuilder
  func `ifLet`<P, T, F>(_ property: P?,
                        @ViewBuilder trueReturn trueTransform: (Self, P) -> T,
                        @ViewBuilder elseReturn falseTransform: (Self) -> F) -> some View
  where T: View, F: View {
    if let property = property {
      trueTransform(self, property)
    } else {
      falseTransform(self)
    }
  }
  
  @ViewBuilder
  func `ifLet`<P, T>(_ property: P?,
                     @ViewBuilder trueReturn trueTransform: (Self, P) -> T
  ) -> some View where T: View {
    if let property = property {
      trueTransform(self, property)
    } else {
      self
    }
  }
}


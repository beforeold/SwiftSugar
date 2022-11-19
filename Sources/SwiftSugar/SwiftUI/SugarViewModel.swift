//
//  SugarViewModel.swift
//  SwiftSugar
//
//  Created by beforeold on 2022/11/12.
//

import Foundation
import Combine

@available(iOS 13.0, *)
open class SugarViewModel<State>: ObservableObject {
  @Published open var state: State
  
  public init(initialState: State) {
    self._state = Published(initialValue: initialState)
  }
}


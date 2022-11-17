//
//  UIColor+Extension.swift
//  
//
//  Created by beforeold on 2022/11/17.
//

import SwiftUI

@available(iOS 14.0, *)
extension Sugar where Base: UIColor {
  public var accentColor: UIColor {
    return .init(Color.accentColor)
  }
}

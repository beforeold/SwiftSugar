//
//  StringConvertible+Sugar.swift
//
//
//  Created by beforeold on 2022/8/20.
//

import Foundation


public extension CustomStringConvertible {
    func printed() {
        print(self)
    }
}

public extension CustomDebugStringConvertible {
    func debugPrinted() {
        debugPrint(self)
    }
}

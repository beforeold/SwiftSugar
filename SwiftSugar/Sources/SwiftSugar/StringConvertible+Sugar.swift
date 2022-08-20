//
//  StringConvertible+Sugar.swift
//
//
//  Created by Brook16 on 2022/8/20.
//

import Foundation


public extension CustomStringConvertible {
    func printed() {
        print(self)
    }
}

public extension CustomDebugStringConvertible {
    func printed() {
        print(self)
    }
}

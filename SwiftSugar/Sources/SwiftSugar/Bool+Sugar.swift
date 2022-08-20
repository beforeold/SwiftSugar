//
//  Bool+Sugar.swift
//  
//
//  Created by Brook16 on 2022/8/20.
//

import Foundation

public extension Bool {
    @discardableResult
    func assertTrue() -> Bool {
        assert(self == true)
        
        return true
    }
    
    @discardableResult
    func assertFalse() -> Bool {
        assert(self == false)
        
        return true
    }
}

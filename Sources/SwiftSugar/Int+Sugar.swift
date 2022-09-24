//
//  Int+Sugar.swift
//
//
//  Created by beforeold on 2022/8/20.
//


public extension Int {
    func times(_ work: () -> Void) {
        for _ in 0..<self {
            work()
        }
    }
    
    func enumerate(_ work: (Int) -> Void) {
        for i in 0..<self {
            work(i)
        }
    }
}

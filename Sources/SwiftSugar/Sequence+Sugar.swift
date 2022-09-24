//
//  Sequence+Sugar.swift
//  
//
//  Created by beforeold on 2022/9/23.
//

import Foundation

public extension Sequence {
    /// join the sequence with seperator, for example transform array [1, 2, 3] into string "1,2,3"
    func componentsJoined(by seperator: String = ",") -> String {
        return map { "\($0)" }.joined()
    }
}

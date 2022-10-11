//
//  PrintSugar.swift
//  
//
//  Created by beforeold on 2022/9/24.
//

import Foundation

// https://stackoverflow.com/questions/38773979/is-there-a-way-to-pretty-print-swift-dictionaries-to-the-console
public func printSugar(_ array: [Any]) {
    printSugar(array as AnyObject)
}

public func printSugar(_ dictionary: [AnyHashable: Any]) {
    printSugar(dictionary as AnyObject)
}

private func printSugar(_ object: AnyObject) {
    let desc = object.description ?? "null"
    print(desc.sugar.unicodeReplaced())
}

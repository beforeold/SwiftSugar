//
//  PrintSugar.swift
//  
//
//  Created by beforeold on 2022/9/24.
//

import Foundation

// https://stackoverflow.com/questions/38773979/is-there-a-way-to-pretty-print-swift-dictionaries-to-the-console
public func sugarPrintJSON(_ array: [Any]) {
  sugarPrintJSON(array as AnyObject)
}

public func sugarPrintJSON(_ dictionary: [AnyHashable: Any]) {
  sugarPrintJSON(dictionary as AnyObject)
}

private func sugarPrintJSON(_ object: AnyObject) {
  let desc = object.description ?? "null"
  print(desc.sugar.unicodeReplaced())
}

public func sugarDebugPrint(_ items: Any...,
                            function: String = #function,
                            line: Int = #line,
                            column: Int = #column) {
#if DEBUG
  print(items, "func \(function)",
        "line: \(line)",
        "column: \(column)")
#endif
}

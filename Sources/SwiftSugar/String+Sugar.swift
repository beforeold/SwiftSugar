//
//  File.swift
//  
//
//  Created by beforeold on 2022/9/25.
//

import Foundation

public extension String {
    /// replace unicode string
    /// 作者：wxd24
    /// 链接：https://juejin.cn/post/6844903974017957902
    /// 来源：稀土掘金
    /// 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    func unicodeReplaced() -> String {
        let tempStr1 = self.replacingOccurrences(of: "\\u", with: "\\U")
        let tempStr2 = tempStr1.replacingOccurrences(of: "\"", with: "\\\"")
        let tempStr3 = "\"" + tempStr2 + "\""
        guard let tempData = tempStr3.data(using: .utf8) else {
            return self
        }
        
        guard let propertyList = try? PropertyListSerialization.propertyList(from: tempData,
                                                                             options: [.mutableContainers],
                                                                             format: nil) as? String else {
            return self
        }
        return propertyList.replacingOccurrences(of: "\\r\\n", with: "\n")
    }
}

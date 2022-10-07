//
//  A_Sugar.swift
//  
//
//  Created by beforeold on 2022/10/7.
//

public struct Sugar<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol SugarCompatible {
    /// Extended type
    associatedtype Base

    /// Reactive extensions.
    static var sugar: Sugar<Base>.Type { get set }

    /// Reactive extensions.
    var sugar: Sugar<Base> { get set }
}

extension SugarCompatible {
    /// Reactive extensions.
    public static var sugar: Sugar<Self>.Type {
        get { Sugar<Self>.self }
        // this enables using Reactive to "mutate" base type
        // swiftlint:disable:next unused_setter_value
        set { }
    }

    /// Reactive extensions.
    public var sugar: Sugar<Self> {
        get { Sugar(self) }
        // this enables using Reactive to "mutate" base object
        // swiftlint:disable:next unused_setter_value
        set { }
    }
}

import Foundation

/// Extend NSObject with `sug` proxy.
extension NSObject: SugarCompatible { }

//
//  OnceSugar.swift
//  
//
//  Created by beforeold on 2022/9/23.
//

import Foundation

/// a type to ensure task run only once
public class OnceSugar {
  /// whether done
  private var isDone = false
  
  /// a queue instance used for thread safe when needed
  private let queue: DispatchQueue?
  
  /// create an instance
  /// - Parameter threadSafe: whether keep thread safe, default to be false.
  public init(threadSafe: Bool = false) {
    queue = threadSafe ? DispatchQueue(label: "com.budswift.onceflag.queue") : nil
  }
  
  /// call to run the task
  /// - Parameter task: the task will be called if not done
  /// - Returns: whether the task is excecuted this time
  @discardableResult
  public func onceOnly(_ task: () throws -> Void) rethrows -> Bool {
    if let queue = queue {
      var ret = false
      try queue.sync {
        ret = try handleTask(task)
      }
      return ret
    }
    
    return try handleTask(task)
  }
  
  /// handle the actual task
  private func handleTask(_ task: () throws -> Void) rethrows -> Bool {
    if isDone {
      return false
    }
    
    try task()
    isDone = true
    return true
  }
}

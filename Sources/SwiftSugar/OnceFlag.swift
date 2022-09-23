//
//  OnceFlag.swift
//  
//
//  Created by beforeold on 2022/9/23.
//

import Foundation

/// a type to ensure task run only once
public class OnceFlag {
    /// whether done
    private var isDone = false
    
    /// a queue instance used for thread safe when needed
    private let queue: DispatchQueue?
    
    /// create an instance
    /// - Parameter threadSafe: whether keep thread safe
    public init(threadSafe: Bool = false) {
        queue = threadSafe ? DispatchQueue(label: "com.budswift.onceflag.queue") : nil
    }
    
    /// call to run the task
    /// - Parameter task: the task will be called if not done
    /// - Returns: whether the task is excecuted this time
    @discardableResult
    public func onceOnly(_ task: () -> Void) -> Bool {
        if let queue = queue {
            var ret = false
            queue.sync {
                ret = handleTask(task)
            }
            return ret
        }
        
        return handleTask(task)
    }
    
    /// handle the actual task
    private func handleTask(_ task: () -> Void) -> Bool {
        if isDone {
            return false
        }
        
        task()
        isDone = true
        return true
    }
}

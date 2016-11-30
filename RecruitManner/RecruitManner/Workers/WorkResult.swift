//
//  StoreResult.swift
//  RecruitManner
//
//  Created by Jiang Duan on 16/11/30.
//  Copyright © 2016年 Jiang Duan. All rights reserved.
//

import Foundation

enum WorkResult<Value> {
    case success(Value)
    case failure(Error)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    var isFailure: Bool {
        return !isSuccess
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
}

// MARK: - CustomStringConvertible

extension WorkResult: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success:
            return "SUCCESS"
        case .failure:
            return "FAILURE"
        }
    }
}

// MARK: - CustomDebugStringConvertible

extension WorkResult: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return "SUCCESS: \(value)"
        case .failure(let error):
            return "FAILURE: \(error)"
        }
    }
}

enum WorkErrorCode: Int {
    case transformFailed = 1
}

extension WorkResult {
    
    static func newError(_ code: WorkErrorCode, failureReason: String) -> NSError {
        let errorDomain = "com.storeresult.error"
        
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        let returnError = NSError(domain: errorDomain, code: code.rawValue, userInfo: userInfo)
        
        return returnError
    }
    
    // Note: rethrows 用于参数是一个会抛出异常的闭包的情况，该闭包的异常不会被捕获，会被再次抛出，所以可以直接使用 try，而不用 do－try－catch
    
    // U 可能为 Optional
    public func map<U> ( transform: (Value) throws -> U) rethrows -> WorkResult<U> {
        switch self {
        case .failure(let error):
            return .failure(error)
        case .success(let value):
            return .success(try transform(value))
        }
    }
    
    // 若 transform 的返回值为 nil 则作为异常处理
    public func flatMap<U> (transform: (Value) throws -> U?) rethrows -> WorkResult<U> {
        switch self {
        case .failure(let error):
            return .failure(error)
        case .success(let value):
            guard let transformedValue = try transform(value) else {
                return .failure(WorkResult.newError(.transformFailed, failureReason: "返回值为 nil 则作为异常处理"))
            }
            return .success(transformedValue)
        }
    }
    
    // 适用于 transform(value) 之后可能产生 error 的情况
    public func flatMap<U> (transform: (Value) throws -> WorkResult<U>) rethrows -> WorkResult<U> {
        switch self {
        case .failure(let error):
            return .failure(error)
        case .success(let value):
            return try transform(value)
        }
    }
    
    // 处理错误，并向下传递
    public func mapError(transform: (Error) throws -> NSError) rethrows -> WorkResult<Value> {
        switch self {
        case .failure(let error):
            return .failure(try transform(error))
        case .success(let value):
            return .success(value)
        }
    }
    
    // 处理数据（不再向下传递数据，作为数据流的终点）
    public func handleValue(handler: (Value) -> Void) {
        switch self {
        case .failure(_):
            break
        case .success(let value):
            handler(value)
        }
    }
    
    // 处理错误（终点）
    public func handleError(handler: (Error) -> Void) {
        switch self {
        case .failure(let error):
            handler(error)
        case .success(_):
            break
        }
    }
    
    // 处理数据（不再向下传递数据，作为数据流的终点）或 处理错误（终点）
    public func handle(value valueHandler: ((Value) -> Void)? = nil, orError errorHandler: ((Error) -> Void)? = nil) {
        switch self {
        case .failure(let error):
            errorHandler?(error)
        case .success(let value):
            valueHandler?(value)
        }
    }
}

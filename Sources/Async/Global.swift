/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Platform

var _async: Async!
var registered = false

public var async: Async = {
    guard registered else {
        print("fatal error: async system is not registered, please call " +
            "Async(Fiber/Tarantool)Dispatch().registerGlobal() first")
        exit(1)
    }
    return _async
}()

extension Async {
    @discardableResult
    public func registerGlobal() -> Self {
        guard !(_async is Self) else {
            return self
        }
        guard !registered else {
            fatalError("the global async object was already initialized")
        }
        registered = true
        _async = self
        return self
    }
}

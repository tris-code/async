/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public var async: Async!

var registered = false

extension Async {
    @discardableResult
    public func registerGlobal() -> Self {
        guard !registered else {
            fatalError("the global async object was already initialized")
        }
        registered = true
        async = self
        return self
    }
}

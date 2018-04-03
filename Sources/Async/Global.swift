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

var initialized = false
@usableFromInline var _async: Async = AsyncInitializer()

public var async: Async {
    @inline(__always) get {
        return _async
    }
    set {
        guard !initialized else {
            fatalError("the global async object has already been initialized")
        }
        initialized = true
        _async = newValue
    }
}

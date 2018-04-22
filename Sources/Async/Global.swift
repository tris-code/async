/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************
 *  This file contains code that has not yet been described                   *
 ******************************************************************************/

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

/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

// - A complete hack just to have much nicer API:
//
// async.use(Fiber.self)
//
// - instead of:
//
// AsyncFiber.registerGlobal()

public protocol Asynchronous {
    static var async: Async { get }
}

extension Async {
    public func use(_ system: Asynchronous.Type) {
        async = system.async
    }

    /// For testing
    func setUp(_ system: Asynchronous.Type) {
        guard !initialized else {
            // allow to run tests with the same async
            if type(of: async) != type(of: system.async) {
                fatalError("async: conflict")
            }
            return
        }
        use(system)
    }
}

import Platform
import struct Foundation.Date
import struct Dispatch.DispatchQoS
import class Dispatch.DispatchQueue

struct AsyncInitializer: Async {
    var loop: AsyncLoop {
        die()
    }

    func die() -> Never {
        print("fatal error: async system is not registered")
        print("please call `async.use(Fiber(Tarantool).self)` first")
        exit(1)
    }

    func task(_ closure: @escaping AsyncTask) {
        die()
    }

    func syncTask<T>(
        onQueue queue: DispatchQueue,
        qos: DispatchQoS,
        deadline: Date,
        task: @escaping () throws -> T) throws -> T
    {
        die()
    }

    func sleep(until deadline: Date) {
        die()
    }

    func wait(
        for descriptor: Descriptor,
        event: IOEvent,
        deadline: Date) throws
    {
        die()
    }

    func testCancel() throws {
        die()
    }
}

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

import Time
import Platform

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
        deadline: Time,
        task: @escaping () throws -> T) throws -> T
    {
        die()
    }

    func sleep(until deadline: Time) {
        die()
    }

    func wait(
        for descriptor: Descriptor,
        event: IOEvent,
        deadline: Time) throws
    {
        die()
    }

    func testCancel() throws {
        die()
    }
}

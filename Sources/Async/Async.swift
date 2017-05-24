/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import struct Foundation.Date
import struct Dispatch.DispatchQoS

public typealias AsyncTask = () -> Void

public protocol Async {
    var loop: AsyncLoop { get }
    var awaiter: IOAwaiter? { get }

    func task(_ closure: @escaping AsyncTask) -> Void

    func syncTask<T>(
        qos: DispatchQoS.QoSClass,
        deadline: Date,
        task: @escaping () throws -> T
    ) throws -> T
}

public protocol AsyncLoop {
    func run()
    func run(until: Date)
}

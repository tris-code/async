# Async

An abstraction over coroutine-based io poller and asynchronous task.

This design allows us to easily swap our fiber system to [another one](https://github.com/tris-foundation/tarantool) provided by the host application.

## Package.swift

```swift
.package(url: "https://github.com/tris-foundation/async.git", .branch("master"))
```

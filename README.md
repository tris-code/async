# Async

An abstraction over coroutine-based io poller and asynchronous task.

This design allows us to easily swap our fiber system to [another one](https://github.com/tris-foundation/tarantool) provided the host application.

Also provides a fallback to blocking sockets and spawns a [dispatch](https://github.com/tris-foundation/async-dispatch) task instead of a fiber<br>
if you can't use cooperative multitasking for some reason.

## Package.swift

```swift
.package(url: "https://github.com/tris-foundation/async.git", .branch("master"))
```

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

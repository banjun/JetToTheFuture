import Foundation
import BrightFutures
import Result

private let forcedFutureQueue = DispatchQueue(label: "forcedFutureQueue")
/// synchronously turn Future into Result on the main queue
public func forcedFuture<T, E>(createFuture: @escaping () -> Future<T, E>) -> Result<T, E> {
    // avoid deadlock by waiting using forced() on main queue for a Future created on main queue (as of BrightFutures 5.1.0)
    // also avoid the optimization that introduces main thread block execution by just calling the block in DispatchQueue.global().sync on main thread
    // for example, (f1 ?? f2).forced() on main thread causes deadlock
    var future: Future<T, E>?
    let sem = DispatchSemaphore(value: 0)
    forcedFutureQueue.async {
        future = createFuture()
        sem.signal()
    }
    sem.wait()
    return future!.forced()
}

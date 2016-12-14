import Foundation
import BrightFutures
import JetToTheFuture

struct DummyError: Error {let error: Error?}

func request(url: String) -> Future<HTTPURLResponse, DummyError> {
    let p = Promise<HTTPURLResponse, DummyError>()
    URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
        guard let response = response as? HTTPURLResponse else { return p.failure(DummyError(error: error)) }
        p.success(response)
        }.resume()
    return p.future
}

let r = forcedFuture {request(url: "https://www.apple.com/")}
print("\(r)")
// no need to run RunLoop to wait at the end of the script

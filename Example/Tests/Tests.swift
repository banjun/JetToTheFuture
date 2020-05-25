// https://github.com/Quick/Quick

import Quick
import Nimble
import BrightFutures
import JetToTheFuture
import Foundation

private func request(url: String) -> Future<HTTPURLResponse, DummyError> {
    let p = Promise<HTTPURLResponse, DummyError>()
    URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
        guard let response = response as? HTTPURLResponse else { return p.failure(DummyError(error: error)) }
        p.success(response)
    }.resume()
    return p.future
}

class JetToTheFutureSpec: QuickSpec {
    override func spec() {
        describe("forcedFuture") {
            it("never deadlock") {
                let result = forcedFuture {request(url: "https://www.apple.com/")}
                let response = result.value
                expect(response).notTo(beNil())
                expect(response?.statusCode).to(equal(200))
            }

            it("correct async way") {
                let result = request(url: "https://www.apple.com/")
                expect(result.value).toNotEventually(beNil())
                expect(result.value?.statusCode).toEventually(equal(200))
            }

            // replace xit() -> it() to test the test
            xit("incorrect async way") {
                let result = request(url: "https://www.apple.com/")
                let response = result.value // incorrectly bind future value at the time
                expect(response).notTo(beNil())
                expect(response?.statusCode).toEventually(equal(200))
            }
        }
    }
}

struct DummyError: Error {
    let error: Error?
}

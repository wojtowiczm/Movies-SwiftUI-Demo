
//  Created by Michał Wójtowicz

import Foundation
import Combine

protocol NetworkSession {
    func dataTaskPublisher(request: URLRequest) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>
}

extension URLSession: NetworkSession {
    func dataTaskPublisher(request: URLRequest) -> AnyPublisher<DataTaskPublisher.Output, DataTaskPublisher.Failure> {
        dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}

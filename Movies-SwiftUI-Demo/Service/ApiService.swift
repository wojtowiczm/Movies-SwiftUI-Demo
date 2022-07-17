
//  Created by Michał Wójtowicz

import Foundation
import Combine

enum ApiContants {
    static let apiKey = "55957fcf3ba81b137f8fc01ac5a31fb5"
}

final class ApiService<Response: Decodable> {
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    let session: NetworkSession
    
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
 
    func loadData(for request: URLRequest) -> AnyPublisher<Response, Error> {
        session
            .dataTaskPublisher(request: request)
            .map(\.data)
            .decode(type: Response.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}

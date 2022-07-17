
//  Created by Michał Wójtowicz
import Foundation
import Combine

protocol ConfigServiceLogic {
    func fetchConfiguration() -> AnyPublisher<ApiConfiguration, Error>
}

extension ApiService: ConfigServiceLogic where Response == ApiConfiguration {
    func fetchConfiguration() -> AnyPublisher<ApiConfiguration, Error> {
        if let config = ApiConfiguration.current {
            return Just(config)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        let url = URL(string: "https://api.themoviedb.org/3/configuration?api_key=\(ApiContants.apiKey)")!
        let urlRequest = URLRequest(url: url)
        return loadData(for: urlRequest)
    }
}

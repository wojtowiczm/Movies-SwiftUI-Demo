
//  Created by Michał Wójtowicz

import Foundation
import Combine

protocol MostPopularServiceLogic {
    func fetchMostPopular(at page: Int) -> AnyPublisher<MostPopularApi.Response, Error>
}

extension ApiService: MostPopularServiceLogic where Response == MostPopularApi.Response {
    func fetchMostPopular(at page: Int) -> AnyPublisher<MostPopularApi.Response, Error> {
        let requestData = MostPopularApi.Request(page: page)
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=\(requestData.page)&api_key=\(ApiContants.apiKey)")!
        let urlRequest = URLRequest(url: url)
        
        return loadData(for: urlRequest)
    }
}

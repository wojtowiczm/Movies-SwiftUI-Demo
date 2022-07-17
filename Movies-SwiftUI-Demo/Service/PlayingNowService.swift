
//  Created by Michał Wójtowicz

import Foundation
import Combine

protocol PlayingNowServiceLogic {
    func fetchPlayingNow() -> AnyPublisher<PlayingNowApi.Response, Error>
}

extension ApiService: PlayingNowServiceLogic where Response == PlayingNowApi.Response {
    func fetchPlayingNow() -> AnyPublisher<PlayingNowApi.Response, Error> {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=\(ApiContants.apiKey)")!
        let urlRequest = URLRequest(url: url)
        
        return loadData(for: urlRequest)
    }
}

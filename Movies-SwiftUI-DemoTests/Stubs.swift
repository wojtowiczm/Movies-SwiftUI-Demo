
//  Created by Michał Wójtowicz

@testable import Movies_SwiftUI_Demo
import Foundation
import Combine

final class NetworkSessionStub: NetworkSession {
    var request: URLRequest!
    var output: URLSession.DataTaskPublisher.Output!
    
    func dataTaskPublisher(request: URLRequest) -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure> {
        self.request = request
        return Just(output).setFailureType(to: URLSession.DataTaskPublisher.Failure.self).eraseToAnyPublisher()
    }
}

final class MostPopularApiStub: MostPopularServiceLogic {
    var page: Int?
    var response: MostPopularApi.Response!
    
    func fetchMostPopular(at page: Int) -> AnyPublisher<MostPopularApi.Response, Error> {
        self.page = page
        return Just(response).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}


final class ConfigApiStub: ConfigServiceLogic {
    var response: ApiConfiguration!
    
    func fetchConfiguration() -> AnyPublisher<ApiConfiguration, Error> {
        Just(response).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

final class PlayingNowApiStub: PlayingNowServiceLogic {
    var response: PlayingNowApi.Response!
    
    func fetchPlayingNow() -> AnyPublisher<PlayingNowApi.Response, Error> {
        Just(response).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

final class MovieDetailsApiStub: MovieDetailsServiceLogic {
    var response: MovieDetails!
    var movieId: String?
    
    func fetchMovieDetails(for movieId: String) -> AnyPublisher<MovieDetails, Error> {
        self.movieId = movieId
        
        return Just(response).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}


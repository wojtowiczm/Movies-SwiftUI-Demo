
//  Created by Michał Wójtowicz

import Foundation
import Combine

protocol MovieDetailsServiceLogic {
    func fetchMovieDetails(for movieId: String) -> AnyPublisher<MovieDetails, Error>
}

extension ApiService: MovieDetailsServiceLogic where Response == MovieDetails {
    func fetchMovieDetails(for movieId: String) -> AnyPublisher<MovieDetails, Error> {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(ApiContants.apiKey)")!
        let urlRequest = URLRequest(url: url)
        
        return loadData(for: urlRequest)
    }
}

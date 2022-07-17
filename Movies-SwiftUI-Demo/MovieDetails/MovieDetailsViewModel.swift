
//  Created by Michał Wójtowicz

import Foundation
import Combine

final class MovieDetailsViewModel: ObservableObject {
    
    @Published var movie: Movie
    @Published var movieDetails: MovieDetails?
    
    var dateAndDuration: String {
        movieDetails.map {
            "\(movie.releaseDate ?? "") - \($0.runtime) min"
        }
        ?? movie.releaseDate
        ?? ""
    }
    
    let detailsService: MovieDetailsServiceLogic

    init(movie: Movie, detailsService: MovieDetailsServiceLogic = ApiService<MovieDetails>()) {
        self.movie = movie
        self.detailsService = detailsService
        loadDetails()
    }
    
    private var cancellableBag: Set<AnyCancellable> = []
    
    func loadDetails() {
        detailsService.fetchMovieDetails(for: String(movie.id))
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { print($0) }, // TODO: Add error handling
                receiveValue: { [weak self] details in
                    self?.movieDetails = details
                })
            .store(in: &cancellableBag)
    }
}

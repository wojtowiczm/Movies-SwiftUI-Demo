
//  Created by Michał Wójtowicz

@testable import Movies_SwiftUI_Demo

enum Mocks {
    static let movie = Movie(adult: .random(), backdropPath: "", id: .random(in: 0...100), originalLanguage: "ru", originalTitle: "Some title", overview: "blah blah", popularity: 100, posterPath: "", releaseDate: "", title: "blah", video: .random(), voteAverage: .random(in: 0...10))
    
    static let movieDetails = MovieDetails(adult: .random(), backdropPath: "", id: .random(in: 0...100), originalLanguage: "", originalTitle: "", overview: "", popularity: 20, posterPath: "ds", releaseDate: "aa", title: "bbb", video: .random(), voteAverage: 3.2, genres: [.init(id: .random(in: 0...100), name: "aaa")], runtime: 120)
    
    static let config = ApiConfiguration(images: .init(baseUrl: "base", logoSizes: ["123"], posterSizes: ["1234"]))
}

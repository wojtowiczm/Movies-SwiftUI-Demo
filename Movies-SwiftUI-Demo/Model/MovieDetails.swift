
//  Created by Michał Wójtowicz
import Foundation

struct MovieDetails: Codable, Equatable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let genres: [Genre]?
    let runtime: Int
}

struct Genre: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
}

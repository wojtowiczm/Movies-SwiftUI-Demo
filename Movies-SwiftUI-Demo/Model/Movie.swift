
//  Created by Michał Wójtowicz

import Foundation

struct Movie: Codable, Identifiable, Equatable {
    
    enum ImageSize {
        case small, big
    }
    
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
    
    func imageUrl(size: ImageSize) -> URL? {
        ApiConfiguration.current.flatMap { config in
            guard let posterPath = posterPath else { return nil }
            let imgSize: String? = {
                switch size {
                case .small:
                    return config.images.posterSizes.first
                case .big:
                    return config.images.posterSizes.last
                }
            }()
            return URL(string: "\(config.images.baseUrl)\(imgSize ?? "")\(posterPath)")
        }
    }
}

// MARK - Endpoint models
enum PlayingNowApi {
    struct Response: Decodable {
        let results: [Movie]
    }
}


enum MostPopularApi {
    struct Request: Encodable {
        let page: Int
    }
    
    struct Response: Decodable {
        let results: [Movie]?
    }
}

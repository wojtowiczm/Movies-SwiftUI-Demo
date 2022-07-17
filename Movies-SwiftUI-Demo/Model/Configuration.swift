
//  Created by Michał Wójtowicz

import Foundation

struct ApiConfiguration: Codable, Equatable {
    
    struct Images: Codable, Equatable {
        let baseUrl: String
        let logoSizes: [String]
        let posterSizes: [String]
    }
    
    let images: Images
    
    static var current: ApiConfiguration?
}

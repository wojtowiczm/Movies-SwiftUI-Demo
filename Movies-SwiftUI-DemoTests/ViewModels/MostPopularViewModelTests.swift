
//  Created by Michał Wójtowicz

import XCTest
import Combine
@testable import Movies_SwiftUI_Demo

final class MostPopularViewModelTests: XCTestCase {

    var mostPopularStub: MostPopularApiStub!
    var configStub: ConfigApiStub!
    var sut: MostPopularViewModel!
    
    override func setUp() {
        ApiConfiguration.current = nil
        mostPopularStub = .init()
        configStub = .init()
        sut = MostPopularViewModel(mostPopularService: mostPopularStub, configService: configStub)
    }

    func testLoadNextData() throws {
        mostPopularStub.response = .init(results: [Mocks.movie])
        configStub.response = Mocks.config
        let moviePublisher = sut.$mostPopularMovies.collectNext(1)
        sut.loadNextData()
        
        let result = try await(moviePublisher)
        
        XCTAssertEqual(result.first!.first!, Mocks.movie)
        XCTAssertEqual(ApiConfiguration.current, Mocks.config)
        
    }
}


//  Created by Michał Wójtowicz

import XCTest
import Combine
@testable import Movies_SwiftUI_Demo

final class MovieDetaildViewModelTests: XCTestCase {
    var apiStub: MovieDetailsApiStub!
    var sut: MovieDetailsViewModel!
    
    override func setUp() {
        apiStub = .init()
        apiStub.response = Mocks.movieDetails
        sut = MovieDetailsViewModel(movie: Mocks.movie, detailsService: apiStub)
    }
    
    func testLoadOnInit() throws {
        let publisher = sut.$movieDetails.collectNext(1)
        let result = try await(publisher)
        XCTAssertEqual(result.first, Mocks.movieDetails)
        XCTAssertEqual(apiStub.movieId, String(sut.movie.id))
    }

    func testLoadDetails() throws {
        let publisher = sut.$movieDetails.collectNext(2)
        sut.loadDetails()
        let result = try await(publisher)
        XCTAssertEqual(result.last, Mocks.movieDetails)
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(apiStub.movieId, String(sut.movie.id))
    }
}

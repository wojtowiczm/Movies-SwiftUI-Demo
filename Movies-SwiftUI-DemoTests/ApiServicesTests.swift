
//  Created by Michał Wójtowicz

import XCTest
import Combine
@testable import Movies_SwiftUI_Demo

final class ApiServiceTests: XCTestCase {
    
    func testMostPopularApiService() {
        let session = NetworkSessionStub()
        session.output = (data: Data(), response: URLResponse())
        let sut = ApiService<MostPopularApi.Response>(session: session)
        let page = 777777
        _  = sut.fetchMostPopular(at: page)
        let expectedUrl = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=\(page)&api_key=\(ApiContants.apiKey)"
        XCTAssertEqual(session.request.url!.absoluteString, expectedUrl)
    }
    
    func testMovieDetailsApiService() {
        let session = NetworkSessionStub()
        session.output = (data: Data(), response: URLResponse())
        let sut = ApiService<MovieDetails>(session: session)
        let id = "1232131"
        _  = sut.fetchMovieDetails(for: id)
        let expectedUrl = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(ApiContants.apiKey)"
        XCTAssertEqual(session.request.url!.absoluteString, expectedUrl)
    }
    
    func testPlayingNowApiService() {
        let session = NetworkSessionStub()
        session.output = (data: Data(), response: URLResponse())
        let sut = ApiService<PlayingNowApi.Response>(session: session)
        _  = sut.fetchPlayingNow()
        let expectedUrl = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=\(ApiContants.apiKey)"
        XCTAssertEqual(session.request.url!.absoluteString, expectedUrl)
    }
    
    
    func testConfigApiService() {
        ApiConfiguration.current = nil
        let session = NetworkSessionStub()
        session.output = (data: Data(), response: URLResponse())
        let sut = ApiService<ApiConfiguration>(session: session)
        _  = sut.fetchConfiguration()
        let expectedUrl = "https://api.themoviedb.org/3/configuration?api_key=\(ApiContants.apiKey)"
        XCTAssertEqual(session.request.url!.absoluteString, expectedUrl)
    }
    
    func testConfigApiServiceForAlreadyCahedConfig() {
        ApiConfiguration.current = Mocks.config
        let session = NetworkSessionStub()
        session.output = (data: Data(), response: URLResponse())
        let sut = ApiService<ApiConfiguration>(session: session)
        _  = sut.fetchConfiguration()
        XCTAssertNil(session.request)
    }
    
    func testSerialization() throws {
        ApiConfiguration.current = nil
        let session = NetworkSessionStub()
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try encoder.encode(Mocks.config)
        session.output = (data: data, response: URLResponse())
        let sut = ApiService<ApiConfiguration>(session: session)
        let result = try awaitPublisher(sut.fetchConfiguration())
        XCTAssertEqual(result, Mocks.config)
    }
}

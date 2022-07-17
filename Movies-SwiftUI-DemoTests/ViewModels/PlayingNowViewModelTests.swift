
//  Created by Michał Wójtowicz

import XCTest
import Combine
@testable import Movies_SwiftUI_Demo

final class PlayingNowViewModelTests: XCTestCase {

    var playingNowStub: PlayingNowApiStub!
    var configStub: ConfigApiStub!
    var sut: PlayingNowViewModel!
    
    override func setUp() {
        ApiConfiguration.current = nil
        playingNowStub = .init()
        configStub = .init()
        sut = PlayingNowViewModel(playingNowService: playingNowStub, configService: configStub)
    }

    func testLoadData() throws {
        playingNowStub.response = .init(results: [Mocks.movie])
        configStub.response = Mocks.config
        let publisher = sut.$playingNowMovies.collectNext(1)
        sut.loadData()
        
        let result = try awaitPublisher(publisher)
        
        XCTAssertEqual(result.first!.first!, Mocks.movie)
        XCTAssertEqual(ApiConfiguration.current, Mocks.config)
    }
}

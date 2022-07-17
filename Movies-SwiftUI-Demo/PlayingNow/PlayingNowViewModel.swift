
//  Created by Michał Wójtowicz

import Foundation
import Combine

final class PlayingNowViewModel: ObservableObject {
    @Published var playingNowMovies: [Movie] = []
    
    private let playingNowService: PlayingNowServiceLogic
    private let configService: ConfigServiceLogic
    private var cancellableBag: Set<AnyCancellable> = []
    
    init(
        playingNowService: PlayingNowServiceLogic = ApiService<PlayingNowApi.Response>(),
        configService: ConfigServiceLogic = ApiService<ApiConfiguration>()) {
        self.playingNowService = playingNowService
        self.configService = configService
    }
    
    func loadData() {
        configService.fetchConfiguration()
            .flatMap { [unowned self] config -> AnyPublisher<PlayingNowApi.Response, Error> in
                ApiConfiguration.current = config
                return self.playingNowService.fetchPlayingNow()
            }
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { print($0) },// TODO: Add error handling
                receiveValue: { [weak self] data in
                    self?.playingNowMovies = data
                })
            .store(in: &cancellableBag)
    }
}

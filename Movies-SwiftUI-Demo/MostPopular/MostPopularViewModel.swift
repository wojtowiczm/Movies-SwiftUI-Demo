
//  Created by Michał Wójtowicz

import Foundation
import Combine
import SwiftUI

final class MostPopularViewModel: ObservableObject {
    
    @Published var mostPopularMovies: [Movie] = []
    @Published var allMoviesLoaded = false
    
    private let mostPopularService: MostPopularServiceLogic
    private let configService: ConfigServiceLogic
    private var cancellableBag: Set<AnyCancellable> = []
    private var nextPage: Int = 1
    
    init(
        mostPopularService: MostPopularServiceLogic = ApiService<MostPopularApi.Response>(),
        configService: ConfigServiceLogic = ApiService<ApiConfiguration>()) {
        self.mostPopularService = mostPopularService
        self.configService = configService
    }
    
    func loadNextData() {
        configService.fetchConfiguration()
            .flatMap { [unowned self] config -> AnyPublisher<MostPopularApi.Response, Error> in
                ApiConfiguration.current = config
                return self.mostPopularService.fetchMostPopular(at: nextPage)
            }
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { print($0) }, // TODO: Handle error
                receiveValue: { [weak self] data in
                    self?.nextPage += 1
                    withAnimation {
                        if let newMovies = data {
                            self?.mostPopularMovies.append(contentsOf: newMovies)
                        }
                        self?.allMoviesLoaded = data == nil
                    }
                })
            .store(in: &cancellableBag)
    }
}

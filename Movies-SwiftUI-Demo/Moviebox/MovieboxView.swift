
//  Created by Michał Wójtowicz

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct MovieboxView: View {
    @State var showDetailsOfMovie: Movie?
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text("Placeholder")
                        .font(.largeTitle)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .foregroundColor(.yellow)
                    ScrollView(showsIndicators: false) {
                        PlayingNowView(viewModel: .init(), showDetailsOfMovie: $showDetailsOfMovie)
                        MostPopularView(viewModel: .init(), showDetailsOfMovie: $showDetailsOfMovie)
                    }
                }
                if let movie = showDetailsOfMovie {
                    MovieDetailsView(viewModel: .init(movie: movie), showDetailsOfMovie: $showDetailsOfMovie)
                        .ignoresSafeArea()
                }
            }
            .navigationBarHidden(true)
        }
    }
}


@available(iOS 14.0, *)
struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MovieboxView()
    }
}

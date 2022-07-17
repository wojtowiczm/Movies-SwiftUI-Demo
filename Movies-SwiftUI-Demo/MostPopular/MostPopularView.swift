
//  Created by Michał Wójtowicz

import SwiftUI

@available(iOS 14.0, *)
struct MostPopularView: View {
    @StateObject var viewModel: MostPopularViewModel
    @Binding var showDetailsOfMovie: Movie?
    
    var body: some View {
        LazyVStack {
            SectionHeaderView(title: "Most popular")
            ForEach(viewModel.mostPopularMovies) { movie in
                MovieCell(movie: movie, showDetails: $showDetailsOfMovie)
            }
            if !viewModel.allMoviesLoaded, !viewModel.mostPopularMovies.isEmpty {
                Text("loading more...")
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .foregroundColor(.white)
                    .onAppear(perform: viewModel.loadNextData)
                    .padding()
            }
        }
        .onAppear(perform: viewModel.loadNextData)
    }
}

@available(iOS 14.0, *)
struct MostPopularView_Previews: PreviewProvider {
    static var previews: some View {
        MostPopularView(viewModel: .init(), showDetailsOfMovie: .constant(nil))
    }
}


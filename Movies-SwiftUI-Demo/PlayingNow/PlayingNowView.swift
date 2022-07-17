
//  Created by Michał Wójtowicz

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct PlayingNowView: View {
    @StateObject var viewModel: PlayingNowViewModel
    @Binding var showDetailsOfMovie: Movie?
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: "Playing now")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.playingNowMovies) { movie in
                        KFImage(movie.imageUrl(size: .small))
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 160)
                            .onTapGesture {
                                withAnimation {
                                    showDetailsOfMovie = movie
                                }
                            }
                    }
                }
            }
            .onAppear(perform: viewModel.loadData)
        }
    }
}

@available(iOS 14.0, *)
struct PlayingNowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingNowView(viewModel: .init(), showDetailsOfMovie: .constant(nil))
    }
}





//  Created by Michał Wójtowicz

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    @Binding var showDetailsOfMovie: Movie?
    
    var body: some View {
        ZStack {
            Color(UIColor.black.withAlphaComponent(0.9))
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Spacer()
                    Button(action: { withAnimation { showDetailsOfMovie = nil }}) { Image(systemName: "xmark").foregroundColor(.white) }
                }
                .padding(.vertical, 40)
                KFImage(viewModel.movie.imageUrl(size: .big))
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 190, height: 320)
                Text(viewModel.movie.title)
                    .bold()
                    .font(.title)
                Text(viewModel.dateAndDuration)
                Spacer(minLength: 20)
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .bold()
                        .font(.title)
                    Text(viewModel.movie.overview)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                if let genres = viewModel.movieDetails?.genres {
                    GenresView(genres: genres)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
        }
    }
}

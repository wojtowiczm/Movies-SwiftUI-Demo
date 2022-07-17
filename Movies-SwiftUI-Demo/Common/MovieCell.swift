
//  Created by Michał Wójtowicz

import SwiftUI
import Kingfisher

struct MovieCell: View {
    let movie: Movie
    @Binding var showDetails: Movie?
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                KFImage(movie.imageUrl(size: .small))
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .border(Color.gray, width: 1)
                    .frame(width: 45, height: 80)
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .bold()
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(movie.releaseDate ?? "-")
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
                RatingView(rating: movie.voteAverage)
            }
            .accentColor(.white)
            .padding()
            .onTapGesture {
                withAnimation {
                    showDetails = movie
                }
            }
            Rectangle()
                .fill(Color(UIColor.systemGray))
                .frame(maxWidth: .infinity, maxHeight: 20)
        }
    }
}


//  Created by Michał Wójtowicz

import SwiftUI

@available(iOS 14.0, *)
struct GenresView: View {
    let genres: [Genre]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(genres) { genre in
                    Text(genre.name)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .shadow(radius: 5)
                        .cornerRadius(5)
                }
            }
        }
        .padding()
    }
}

@available(iOS 14.0, *)
struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView(genres: [.init(id: 1, name: "mock"), .init(id: 2, name: "mock2")])
    }
}

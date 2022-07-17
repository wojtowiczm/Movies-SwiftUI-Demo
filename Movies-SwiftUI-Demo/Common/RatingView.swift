
//  Created by Michał Wójtowicz

import SwiftUI

struct RatingView: View {
    let rating: Double
    let minGreenRating: Double = 5
    var formattedRating: String {
        "\(Int(rating * 10))"
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
            OutlineView(progress: 1, color: Color(UIColor.lightGray))
            OutlineView(progress: CGFloat(rating / 10), color: rating >= minGreenRating ? .green : .yellow)
                .rotationEffect(.degrees(-90))
            
            Text(formattedRating)
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 7.5)
    }
}

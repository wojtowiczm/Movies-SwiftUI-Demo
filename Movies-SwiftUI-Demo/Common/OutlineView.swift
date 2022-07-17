
//  Created by Michał Wójtowicz on 13/06/2021.

import SwiftUI

struct OutlineView: View {
    let progress: CGFloat
    let color: Color
    var body: some View {
        Circle()
            .trim(from: 0, to: progress)
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .fill(AngularGradient(gradient: .init(colors: [color]), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
    }
}

struct OutlineView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineView(progress: 0.5, color: .red)
    }
}


//  Created by Michał Wójtowicz

import SwiftUI

struct SectionHeaderView: View {
    let title: String
    var body: some View {
        ZStack(alignment: .leading) {
            Color(UIColor.systemGray)
            Text(title)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: 20)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "test")
    }
}

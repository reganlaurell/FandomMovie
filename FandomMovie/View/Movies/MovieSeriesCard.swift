//
//  MovieSeriesCard.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/12/22.
//

import SwiftUI

struct MovieSeriesCard: View {
    let seriesTitle: String

    var body: some View {
        CardView(content: {
            VStack {
                Text(seriesTitle)
                    .font(.largeTitle)
                    .bold()
                }
            }
        )
    }
}

struct MovieSeriesCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieSeriesCard(seriesTitle: "Marvel")
    }
}

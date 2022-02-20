//
//  MovieDetailCard.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/6/22.
//

import SwiftUI

struct MovieDetailCard: View {
    let cardLabel: String
    let value: String
    let background = Gradient(colors: [.white])
    
    var body: some View {
        CardView(content: {
            VStack {
                Text(cardLabel)
                    .font(.body)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.vertical)
                
                Text(value)
                    .font(.title)
                    .multilineTextAlignment(.trailing)
            }
        })
    }
}

struct MovieDetailCard_Previews: PreviewProvider {
    static var previews: some View {
//        VStack {
//            MovieDetailCard(
//                cardLabel: "Running Time:",
//                value: "124"
//            )
//        }
        
        HStack {
            MovieDetailCard(cardLabel: "Running Time:", value: "124")
            MovieDetailCard(cardLabel: "Watch Order:", value: "3")
        }
    }
}

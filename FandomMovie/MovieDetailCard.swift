//
//  MovieDetailCard.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/6/22.
//

import SwiftUI

struct MovieDetailCard: View {
    var cardLabel: String
    var value: String
    
    var body: some View {
        let cardAndImageWidth: CGFloat = 170
        let cardHeight: CGFloat = 174
        let cornerRadius: CGFloat = 25
        
        ZStack {
          RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(.black, lineWidth: 2)
            .frame(width: cardAndImageWidth, height: cardHeight)
            .background(.ellipticalGradient(colors: [.blue, .red]))
            .opacity(0.9)
            
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
        }
        .frame(width: cardAndImageWidth, height: cardHeight)
        .cornerRadius(cornerRadius)
    }
}

struct MovieDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            MovieDetailCard(cardLabel: "Running Time:", value: "124")
            MovieDetailCard(cardLabel: "Watch Order:", value: "3")
        }
    }
}

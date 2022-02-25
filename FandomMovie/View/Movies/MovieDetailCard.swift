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
    
    var body: some View {
        CardView {
            HStack {
                Text(cardLabel)
                    .bold()
                
                Spacer()
                
                Text(value)
            }.padding()
        }
    }
}

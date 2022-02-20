//
//  WatchlistView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct WatchlistView: View {
    let viewModel = WatchlistViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.fandoms, id: \.self) { fandom in
                switch(fandom) {
                case .harryPotter:
                    NavigationLink {
                        HarryPotterMovieView(viewModel: HarryPotterViewModel())
                    } label: {
                        MovieSeriesCard(seriesTitle: "Harry Potter")
                            .foregroundColor(.black)
                    }.padding()
                    
                case .marvel:
                    NavigationLink {
                        MarvelMovieView(viewModel: MarvelViewModel())
                    } label: {
                        MovieSeriesCard(seriesTitle: "Marvel")
                            .foregroundColor(.black)
                    }.padding()
                }
            }
            
            Spacer()
        }
    }
}

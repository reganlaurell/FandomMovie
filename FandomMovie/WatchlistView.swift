//
//  WatchlistView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct WatchlistView: View {
    var viewModel : MarvelViewModel
    
    var body: some View {
        
        
        List(marvelMovies, id: \.self) { movie in
            NavigationLink {
                MovieDetailsView(movie: movie)
            } label: {
                MovieRow(title: movie.title)
            }
        }
    }
}


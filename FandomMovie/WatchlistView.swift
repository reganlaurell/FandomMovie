//
//  WatchlistView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct WatchlistView: View {
    @ObservedObject var viewModel: MarvelViewModel
    
    var body: some View {
        List(viewModel.marvelMovies) { movie in
            Text(movie.title ?? "oops didnt work")
        }
    }
}


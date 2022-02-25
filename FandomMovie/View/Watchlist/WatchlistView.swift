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
        List {
            ForEach(viewModel.fandoms, id: \.self) { fandom in
                NavigationLink {
                    MovieListView(viewModel: MovieViewModel(fandom: fandom))
                } label: {
                    Text(fandom.getDisplayString(fandom: fandom))
                        .foregroundColor(.black)
                }
            }
        }.listStyle(.plain)
        
        Spacer()
    }
}

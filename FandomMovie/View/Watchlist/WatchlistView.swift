//
//  WatchlistView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import LazyViewSwiftUI
import SwiftUI

struct WatchlistView: View {
    let viewModel = WatchlistViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.fandoms, id: \.self) { fandom in
                NavigationLink {
                    LazyViewSwiftUI.LazyView(
                        MovieListView(viewModel: MovieListViewModel(fandom: fandom))
                    )
                } label: {
                    Text(fandom.getDisplayString(fandom: fandom))
                        .foregroundColor(.black)
                }
            }
        }.listStyle(.plain)
        
        Spacer()
    }
}

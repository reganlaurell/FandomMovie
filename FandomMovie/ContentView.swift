//
//  ContentView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        TabView {
            NavigationView {
                WatchlistView(marvelMovies: MarvelViewModel().getMovies())
                    .navigationTitle("Marvel Movies")
                    .navigationBarTitleDisplayMode(.large)
            }.tabItem {
                    Label("Watchlist", systemImage: "list.and.film")
                    Text("Watchlist")
                }
            RandomMovieView()
                .tabItem {
                    Label("Random", systemImage: "film")
                    Text("Random Movie")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

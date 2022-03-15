//
//  ContentView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI
import LazyViewSwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                WatchlistView()
                    .navigationTitle("Fandoms")
                    .navigationBarTitleDisplayMode(.large)
            }.tabItem {
                Label("Watchlist", systemImage: "list.and.film")
                Text("Watchlist")
            }
            
            NavigationView {
                LazyView(
                    RandomMovieView()
                )
            }.tabItem {
                Label("Random", systemImage: "film")
                Text("Random Movie")
            }
        }
    }
}

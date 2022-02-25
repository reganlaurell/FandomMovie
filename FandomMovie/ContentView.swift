//
//  ContentView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WatchlistView()
                .navigationTitle("Fandoms")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

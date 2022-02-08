//
//  WatchlistView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct WatchlistView: View {
    var viewModel : MarvelViewModel
    @State private var selectedOrder = 0
    
    private let pickerOptions = ["Release Order", "Choronological Order"]
    
    var body: some View {
        
        VStack {
            Picker("Marvel Movie Order", selection: $selectedOrder) {
                ForEach(0..<pickerOptions.count) { index in
                    Text(pickerOptions[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Spacer()
            
            if selectedOrder == 0 {
                List(viewModel.sortReleaseOrder(), id: \.self) { movie in
                    NavigationLink {
                        MovieDetailsView(movie: movie)
                    } label: {
                        MovieRow(title: movie.title)
                    }
                }
            } else {
                List(viewModel.sortChronologically(), id: \.self) { movie in
                    NavigationLink {
                        MovieDetailsView(movie: movie)
                    } label: {
                        MovieRow(title: movie.title)
                    }
                }
            }
        }
    }
}

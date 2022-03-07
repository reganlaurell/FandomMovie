//
//  MarvelMovieView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import SwiftUI

struct MovieListView: View {
    var viewModel : MovieListViewModel
    @State private var selectedOrder = 0
    
    private let pickerOptions = ["Release Order", "Choronological Order"]
    
    var body: some View {
        VStack {
            Picker("\(viewModel.fandom.rawValue.capitalized) Movie Order", selection: $selectedOrder) {
                ForEach(0..<pickerOptions.count) { index in
                    Text(pickerOptions[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            
            List(selectedOrder == 0 ? viewModel.sortReleaseOrder() : viewModel.sortChronologically(), id: \.self
            ) { movie in
                NavigationLink {
                    MovieDetailsView(viewModel: MovieDetailViewModel(from: movie))
                } label: {
                    MovieRow(title: movie.title)
                }
            }.listStyle(.plain)
        }.navigationTitle("\(viewModel.fandom.getDisplayString(fandom: viewModel.fandom)) Movies")
    }
}


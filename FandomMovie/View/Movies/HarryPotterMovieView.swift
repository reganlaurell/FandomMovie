//
//  HarryPotterMovieView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/13/22.
//

import SwiftUI

struct HarryPotterMovieView: View {
    var viewModel = HarryPotterViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.hpSeries, id: \.self) { movie in
                    NavigationLink {
                        MovieDetailsView(movie: movie)
                    } label: {
                        MovieRow(title: movie.title)
                    }
                }
            }
        }
        .navigationTitle("Harry Potter Movies")
    }
}

struct HarryPotterMovieView_Previews: PreviewProvider {
    static var previews: some View {
        HarryPotterMovieView()
    }
}

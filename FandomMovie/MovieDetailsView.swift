//
//  MovieDetailsView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/4/22.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: MarvelMovie
    
    var body: some View {
        VStack {
            Image(systemName: "film")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Title: \(movie.title)")
                Text("Watch order: \(movie.movieId)")
                Text("\(movie.phase)")
                Text("Release Date: \(movie.releaseDate)")
                Text("Running Time: \(movie.runningTime) minutes")
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                        .stroke (.gray, lineWidth: 1)
            )
            .padding(.horizontal)
        
            
            Spacer()
        }
        
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(
            movie: MarvelMovie(
                movieId: 1,
                title: "Iron Man",
                phase: "Phase 1",
                releaseYear: 2008,
                runningTime: 126,
                ratingName: "PG-13",
                releaseDate: "May 2, 2008"
            )
        )
    }
}

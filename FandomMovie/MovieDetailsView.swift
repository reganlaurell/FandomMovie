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
        ScrollView {
            VStack {
                HStack {
                    MovieDetailCard(cardLabel: "", value: movie.phase)
                    MovieDetailCard(cardLabel: "Running Time", value: movie.getRunningTime())
                }
                
                HStack {
                    MovieDetailCard(cardLabel: "Release Order", value: "\(movie.movieId)")
                    if let chronOrder = movie.chronologicalId {
                        MovieDetailCard(cardLabel: "Chronological Order", value: "\(chronOrder)")
                    }
                }
                
                HStack {
                    MovieDetailCard(cardLabel: "Release Year", value: "\(movie.releaseYear)")
                    MovieDetailCard(cardLabel: "Rating", value: "\(movie.ratingName)")
                }
            }
        }
        .navigationTitle(movie.title)
        .navigationViewStyle(.stack)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
        Text("Iron Man").font(.largeTitle)
        MovieDetailsView(
            movie: MarvelMovie(
                movieId: 1,
                chronologicalId: nil,
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
}

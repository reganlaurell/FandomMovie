//
//  MovieDetailsView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/4/22.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                if let releaseId = movie.releaseId {
                    MovieDetailCard(cardLabel: "Release Order", value: "\(releaseId)")
                }
                if let chronId = movie.chronologicalId {
                    MovieDetailCard(cardLabel: "Chronological Order", value: "\(chronId)")
                }
                if let phase = movie.phase {
                    MovieDetailCard(cardLabel: "", value: phase)
                }
                MovieDetailCard(cardLabel: "Running Time", value: movie.getRunningTime())
                MovieDetailCard(cardLabel: "Rating", value: movie.ratingName)
                MovieDetailCard(cardLabel: "Release Year", value: "\(movie.releaseYear)")
            }.padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(.stack)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
        Text("Iron Man").font(.largeTitle)
        MovieDetailsView(
            movie: Movie(
                movieId: 1,
                title: "Iron Man",
                releaseYear: 2008,
                runningTime: 126,
                ratingName: "PG-13",
                releaseDate: "May 2, 2008",
                phase: "Phase 1",
                chronologicalId: nil
            )
            )
        }
    }
}

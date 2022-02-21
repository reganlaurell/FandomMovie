//
//  MovieDetailsView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/4/22.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: FandomMovie
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: movie.posterPath ?? ""), scale: 2) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                    .frame(width: 128, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                if let releaseId = movie.releaseId {
                    MovieDetailCard(cardLabel: "Release Order", value: "\(releaseId)")
                }
                if let chronId = movie.chronologicalId {
                    MovieDetailCard(cardLabel: "Chronological Order", value: "\(chronId)")
                }
                if let phase = movie.phase {
                    MovieDetailCard(cardLabel: "", value: phase)
                }
                MovieDetailCard(cardLabel: "Running Time", value: movie.runningTime)
                MovieDetailCard(cardLabel: "Rating", value: movie.ratingName)
                MovieDetailCard(cardLabel: "Release Year", value: "\(movie.releaseYear)")
            }.padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(.stack)
    }
}

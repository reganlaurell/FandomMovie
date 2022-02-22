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
                if let imageUrl = movie.imageUrl {
                        AsyncImage(
                            url: URL(string: imageUrl),
                            scale: 1
                        ) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: { Color.white }
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                
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

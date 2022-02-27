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
        ScrollView(showsIndicators: false) {
            if let imageUrl = movie.imageUrl {
                AsyncImage(
                    url: URL(string: imageUrl),
                    scale: 1
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: { LoadingIndicator() }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            if let overview = movie.overview {
                MovieDetailCard(cardLabel: "", value: overview)
            }
            
            if let releaseId = movie.releaseId {
                MovieDetailCard(cardLabel: "Release Order", value: movie.formatOrderId(id: releaseId))
            }
            
            if let chronId = movie.chronologicalId {
                MovieDetailCard(cardLabel: "Chronological Order", value: movie.formatOrderId(id: chronId))
            }
            
            MovieDetailCard(cardLabel: "Running Time", value: movie.runningTime)
            
            if let status = movie.status {
                MovieDetailCard(cardLabel: "Status", value: status)
            }
            MovieDetailCard(cardLabel: "Rating", value: movie.ratingName)
            MovieDetailCard(cardLabel: "Release Year", value: "\(movie.releaseYear)")
            
            if let budget = movie.budget {
                MovieDetailCard(cardLabel: "Budget", value: budget)
            }
            
            if let revenue = movie.revenue {
                MovieDetailCard(cardLabel: "Revenue", value: revenue)
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(.stack)
    }
}

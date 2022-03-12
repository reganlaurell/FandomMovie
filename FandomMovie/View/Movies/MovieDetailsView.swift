//
//  MovieDetailsView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/4/22.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if let imageUrl = viewModel.getImageUrl() {
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
            
            if let overview = viewModel.movieInformation.overview {
                MovieDetailCard(cardLabel: "", value: overview)
            }
            
            if let releaseId = viewModel.movieInformation.releaseId {
                MovieDetailCard(cardLabel: "Release Order", value: viewModel.movieInformation.formatOrderId(id: releaseId))
            }
            
            if let chronId = viewModel.movieInformation.chronologicalId {
                MovieDetailCard(cardLabel: "Chronological Order", value: viewModel.movieInformation.formatOrderId(id: chronId))
            }
            
            if let runningTime = viewModel.movieInformation.runningTime {
                MovieDetailCard(cardLabel: "Running Time", value: runningTime)
            }
            
            
            if let rating = viewModel.movieInformation.ratingName {
                MovieDetailCard(cardLabel: "Rating", value: rating)
            }
            
            if let status = viewModel.movieInformation.status, viewModel.movieInformation.showStatus(for: status) {
                MovieDetailCard(cardLabel: "Status", value: status)
            }
            
            if let releaseDate = viewModel.movieInformation.releaseDate {
                MovieDetailCard(cardLabel: "Release Date", value: releaseDate)
            }
            
            if let budget = viewModel.movieInformation.budget {
                MovieDetailCard(cardLabel: "Budget", value: budget)
            }
            
            if let revenue = viewModel.movieInformation.revenue {
                MovieDetailCard(cardLabel: "Revenue", value: revenue)
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle(viewModel.movieInformation.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(.stack)
    }
}

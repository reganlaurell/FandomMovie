//
//  RandomMovieDetailView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 3/13/22.
//

import UIKit
import SwiftUI

struct RandomMovieDetailView: View {
    let viewModel: RandomMovieDetailViewModel
    
    //    @Binding var isPresented: Bool
    
    init(viewModel: RandomMovieDetailViewModel) {
        self.viewModel = viewModel
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = .black
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
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
                        .padding(.top)
                    }
                    
                    if let overview = viewModel.randomMovie.overview {
                        MovieDetailCard(cardLabel: "", value: overview)
                    }
                    
                    if let runtime = viewModel.randomMovie.getRuntime() {
                        MovieDetailCard(cardLabel: "Running Time", value: runtime)
                    }
                    
                    Spacer()
                }.padding()
            }.navigationTitle(viewModel.randomMovie.title ?? "")
        }
    }
}

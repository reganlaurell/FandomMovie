//
//  RandomMoviePickerView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 1/31/22.
//

import SwiftUI

struct RandomMovieView: View {
    let viewModel = RandomMovieViewModel()
    private var randomMovieId: Int?
    @State private var selection = Fandom.marvel
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Text("Select a Fandom: ")
                .font(.headline)
            
            Picker("Select a Fandom:", selection: $selection) {
                ForEach(Fandom.allCases) {
                    Text($0.displayString)
                        .tag($0)
                        .font(.headline)
                }
            }
            .pickerStyle(.wheel)
            .background(Color(.sRGB, white: 0.9, opacity: 0.2))
            
            Button(action: { showSheet.toggle() }, label: {
                Text("Pick a Movie")
                    .font(.headline)
            })
            .padding()
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(8)
            .sheet(isPresented: $showSheet) {
                RandomMovieDetailView(
                    viewModel: RandomMovieDetailViewModel(movieId: viewModel.getRandomMovie(for: selection))
                )
            }
            
            Spacer()
        }.navigationTitle("Random Movie")
    }
}

//
//  MovieRow.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/4/22.
//

import SwiftUI

struct MovieRow: View {
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "film")
            Text(title)
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(title: "Iron Man")
    }
}

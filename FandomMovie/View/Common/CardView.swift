//
//  CardView.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/12/22.
//

import SwiftUI

struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        let cardAndImageWidth: CGFloat = 170
        let cardHeight: CGFloat = 134
        let cornerRadius: CGFloat = 25
        
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(.black, lineWidth: 2)
                .frame(minWidth: cardAndImageWidth, idealHeight: cardHeight)
            
            self.content
        }
        .fixedSize(horizontal: false, vertical: true)
        .cornerRadius(cornerRadius)
    }
}

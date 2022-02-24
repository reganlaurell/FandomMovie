//
//  LoadingIndicator.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/22/22.
//

import SwiftUI

struct LoadingIndicator: View {
    @State var isAnimating: Bool = false
    
    let timing: Double
    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed * 2
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }
    
    var body: some View {
        Image(systemName: "film")
            .font(.system(size: frame.height * 0.9))
            .foregroundColor(primaryColor)
            .scaleEffect(isAnimating ? 1.0 : 0.3)
            .animation(Animation
                        .easeInOut(duration: timing)
                        .repeatForever(autoreverses: true),
                       value: isAnimating
            )
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation
                        .easeInOut(duration: timing * 2)
                        .repeatForever(autoreverses: false),
                       value: isAnimating
            )
            .frame(width: frame.width, height: frame.height, alignment: .center)
            .onAppear {
                isAnimating.toggle()
            }
    }
}

fileprivate struct LoadingView: View {
    let size: CGFloat
    let speed: Double
    let color: Color
    
    init(
        color: Color = .primary,
        size: CGFloat = 50,
        speed: Double = 0.5
    ) {
        self.size = size
        self.speed = speed
        self.color = color
    }
    
    var body: some View {
        LoadingIndicator(color: color, size: size, speed: speed)
    }
}

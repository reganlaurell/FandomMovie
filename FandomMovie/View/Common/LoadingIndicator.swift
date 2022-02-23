//
//  LoadingIndicator.swift
//  FandomMovie
//
//  Created by Regan Laurell on 2/22/22.
//

import SwiftUI

struct LoadingHeart: View {
    
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
            .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true))
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.easeInOut(duration: timing * 2).repeatForever(autoreverses: false))
            .frame(width: frame.width, height: frame.height, alignment: .center)
            .onAppear {
                isAnimating.toggle()
            }
    }
}

public struct LoadingIndicator: View {
    
    let animation: LoadingAnimation
    let size: CGFloat
    let speed: Double
    let color: Color
    
    public init(
        animation: LoadingAnimation = .heart,
        color: Color = .primary,
        size: Size = .medium,
        speed: Speed = .normal
    ) {
            self.animation = animation
            self.size = size.rawValue
            self.speed = speed.rawValue
            self.color = color
    }
    
    public var body: some View {
        switch animation {
        case .heart: LoadingHeart(color: color, size: size, speed: speed)
        }
    }
    
    public enum LoadingAnimation: String, CaseIterable {
        case heart
    }
    
    public enum Speed: Double, CaseIterable {
        case slow = 1.0
        case normal = 0.5
        case fast = 0.25
        
        var stringRepresentation: String {
            switch self {
            case .slow: return ".slow"
            case .normal: return ".normal"
            case .fast: return ".fast"
            }
        }
    }

    public enum Size: CGFloat, CaseIterable {
        case small = 25
        case medium = 50
        case large = 100
        case extraLarge = 150
        
        var stringRepresentation: String {
            switch self {
            case .small: return ".small"
            case .medium: return ".medium"
            case .large: return ".large"
            case .extraLarge: return ".extraLarge"
            }
        }
    }
}

public struct LoadingPreviewView: View {
    let animation: LoadingIndicator.LoadingAnimation
    let sizes = LoadingIndicator.Size.allCases
    let speeds = LoadingIndicator.Speed.allCases
    
    public init(animation: LoadingIndicator.LoadingAnimation) {
        self.animation = animation
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                Text("SIZES")
                    .font(.title)
                    .fontWeight(.semibold)
                    .underline()
                
                ForEach(sizes, id: \.self) { size in
                    VStack(spacing: 0) {
                        LoadingIndicator(animation: animation, size: size, speed: .normal)
                        Text(size.stringRepresentation)
                            .font(.caption)
                    }
                }
            }
            Divider()
            VStack {
                Text("SPEEDS")
                    .font(.title)
                    .fontWeight(.semibold)
                    .underline()

                ForEach(speeds, id: \.self) { speed in
                    VStack(spacing: 0) {
                        LoadingIndicator(animation: animation, size: .medium, speed: speed)
                        Text(speed.stringRepresentation)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct LoadingHeart_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .heart)
    }
}


//
//  Style.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 07/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct ColorStyles {
    // Colors here match the color styles from the design's Styles & Components
    static let buttonPrimaryColor = Color(red: 0.964, green: 0.460, blue: 0.6)
    static let buttonSecondaryColor = Color(red: 0.6, green: 0.6, blue: 0.6)
    static let textPrimaryColor = Color(.white)
    static let textSecondaryColor = Color(red: 0.900, green: 0.900, blue: 0.900, opacity: 1)
    static let  cardColor = Color(red: 0.199, green: 0.199, blue: 0.199, opacity: 1)
    
}

public struct TextFooterStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .foregroundColor(ColorStyles.textSecondaryColor)
            .font(.footnote)
    }
}

public struct TextDetailsStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .foregroundColor(ColorStyles.textSecondaryColor)
            .font(.footnote)
    }
}

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding()
                .background(ColorStyles.cardColor)
                .frame(width: geometry.size.width )
            .cornerRadius(20)
        }
    }
}

extension View {
    func textDetailsStyle() -> some View {
        self.modifier(TextDetailsStyle())
    }
    func textFooterStyle() -> some View {
        self.modifier(TextFooterStyle())
    }
    
    func cardViewModifier() -> some View {
        self.modifier(CardViewModifier())
    }
    
}

public struct PrimaryButton: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(ColorStyles.buttonPrimaryColor)
            .cornerRadius(20)
    }
}

public struct CompletedStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(ColorStyles.buttonSecondaryColor)
            .cornerRadius(20)
    }
}

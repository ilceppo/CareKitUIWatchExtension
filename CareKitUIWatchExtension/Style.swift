//
//  Style.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 07/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct ColorStyles {
    // Colors here match the color styles
    static let buttonPrimaryColor = Color(red: 0.964, green: 0.460, blue: 0.6)
    static let buttonSecondaryColor = Color(red: 0.6, green: 0.6, blue: 0.6)
    static let textPrimaryColor = Color(.white)
    static let textSecondaryColor = Color(red: 0.900, green: 0.900, blue: 0.900)
    static let cardColor = Color(red: 0.199, green: 0.199, blue: 0.199)
    
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
            .font(.system(size: 12))
            .foregroundColor(ColorStyles.textSecondaryColor)
    }
}

public struct TextButtonStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(ColorStyles.textPrimaryColor)
            .background(Color.clear)
    }
}

public struct CardViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding()
                .background(ColorStyles.cardColor)
                .frame(width: geometry.size.width )
                .cornerRadius(15)
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
    func textButtonStyle() -> some View {
        self.modifier(CardViewModifier())
    }
}

public struct PrimaryButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(ColorStyles.buttonPrimaryColor)
            .cornerRadius(15)
            
        
    }
}

public struct CompletedButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(ColorStyles.buttonSecondaryColor)
            .cornerRadius(20)
    }
}

public struct TaskCardButtonStyle: ButtonStyle {
    public let isCompleted: Bool
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(height: 40)
            .background(isCompleted ? ColorStyles.buttonSecondaryColor : ColorStyles.buttonPrimaryColor)
            .cornerRadius(15)
            .font(.system(size: 14, weight: .medium))
          
    }
}

public struct SimpleButton: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 30))
            .foregroundColor(ColorStyles.buttonPrimaryColor)
    }
}

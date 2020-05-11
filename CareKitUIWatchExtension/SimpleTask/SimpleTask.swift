//
//  SimpleTask.swift
//  CareKitUIWatchExtension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct SimpleTask: View {
    
    public init(header: Text?, details: Text?,  footer: Text?, action: (() -> Void)?, isCompleted: Bool) {
        self.header = header
        self.footer = footer
        self.action = action
        self.isCompleted = isCompleted
        self.details = details
    }
    
    let header: Text?
    let footer: Text?
    let isCompleted: Bool
    let details: Text?
    
    let action: (() -> Void)?
    
    public var body: some View {
        
        VStack {
            HStack {
                VStack {
                    header?
                        .bold()
                    details
                        .textDetailsStyle()
                }
                
                Spacer ()
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 30))
                    .foregroundColor(ColorStyles.buttonPrimaryColor)
                    .onTapGesture {
                        (self.action ?? {})()
                }
                .padding(.vertical)
            }
            footer
                .textFooterStyle()
        }
        .cardViewModifier()
    }
}

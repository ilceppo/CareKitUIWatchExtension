//
//  Instructions.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 06/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI
public struct Instructions: View {
    
    public init(instructions: Text?, header: Text?, footer: Text?, action: (() -> Void)?, isCompleted: Bool) {
        self.instructions = instructions
        self.header = header
        self.footer = footer
        self.action = action
        self.isCompleted = isCompleted
    }
    
    let instructions: Text?
    let header: Text?
    let footer: Text?
    let isCompleted: Bool
    
    let action: (() -> Void)?
    
    public var body: some View {
        VStack{
            header?
                .fontWeight(.bold)
            Divider()
            instructions
            footer
                .textFooterStyle()
            Button(action: action ?? {}) {
                HStack {
                    Spacer()
                    Text(isCompleted ? "Completed" : "Mark as completed")
                    Spacer()
                }
            }
            .buttonStyle(MyButtonStyle(isCompleted : .constant(self.isCompleted)))
            .padding()
        }
        .cardViewModifier()
    }
}

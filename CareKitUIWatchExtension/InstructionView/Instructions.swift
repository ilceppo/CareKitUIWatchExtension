//
//  Instructions.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 06/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI
public struct Instructions: View {
    
   public init(instructions: Text?, header: Text?, details: Text?,  footer: Text?, action: (() -> Void)?, isCompleted: Bool) {
        self.instructions = instructions
        self.header = header
        self.footer = footer
        self.action = action
        self.isCompleted = isCompleted
        self.details = details
    }
    
    let instructions: Text?
    let header: Text?
    let footer: Text?
    let isCompleted: Bool
    let details: Text?
    
    let action: (() -> Void)?
    
    public var body: some View {
        VStack{
            header?
                .fontWeight(.bold)
            details
                .textDetailsStyle()
            Divider()
            instructions
            
                
            Button(action: action ?? {}) {
                HStack {
                    Spacer()
                    Text(isCompleted ? "Completed" : "Mark as completed")
                        
                    Spacer()
                }
            }
            .buttonStyle(TaskCardButtonStyle(isCompleted : self.isCompleted))
            .padding()
            footer
            .textFooterStyle()
        }
        .cardViewModifier()
    }
}

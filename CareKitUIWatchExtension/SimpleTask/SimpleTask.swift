//
//  SimpleTask.swift
//  CareKitUIWatchExtension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct SimpleTask: View {

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
        
        VStack(){
            header?
                .fontWeight(.bold)
            Divider()
            instructions
            footer

            Image(systemName: isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                    .font(.system(size: 40))
                    .foregroundColor(ColorStyles.buttonPrimaryColor)
                    .onTapGesture {
                        (self.action ?? {})()
                    }
            
        }.cardViewModifier()
        
    }
}

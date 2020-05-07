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

            if(!isCompleted) {
                Image(systemName: "checkmark.circle")
                .font(.system(size: 40))
                .onTapGesture {
                    (self.action ?? {})()
                }
            }else{
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 40))
                    .onTapGesture {
                        (self.action ?? {})()
                }
            }
            
        }.cardViewModifier()
        
    }
}

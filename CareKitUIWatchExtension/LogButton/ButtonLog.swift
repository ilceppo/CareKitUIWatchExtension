//
//  ButtonLog.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 02/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//
import SwiftUI


public struct ButtonLog: View {
    
    public init(instructions: Text?, header: Text?, footer: Text?, action: (() -> Void)?, details: [String]?) {
        self.instructions = instructions
        self.header = header
        self.footer = footer
        self.action = action
        self.details = details
    }
    
    let instructions: Text?
    let header: Text?
    let footer: Text?
    let details: [String]?
    
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
                    Text("Log")
                    Spacer()
                }
            }
                .buttonStyle(PrimaryButton())
                .padding()
            LogDetailsView(details: details)
                .textDeatilsStyle()
        }
        .cardViewModifier()
    }
}


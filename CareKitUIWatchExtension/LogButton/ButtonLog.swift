//
//  ButtonLog.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 02/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//
import SwiftUI


public struct ButtonLog: View {
    
    public init(instructions: Text?, header: Text?, footer: Text?, action: (() -> Void)?, logDetails: [String]?, details: Text?) {
        self.instructions = instructions
        self.header = header
        self.footer = footer
        self.action = action
        self.logDetails = logDetails
        self.details = details
    }
    
    let instructions: Text?
    let header: Text?
    let footer: Text?
    var logDetails: [String]?
    let details: Text?
    
    let action: (() -> Void)?
    
    public var body: some View {
        GeometryReader { proxy in
                VStack {
                    ScrollView {
                    self.header?
                        .bold()
                    self.details
                        .textDetailsStyle()
                    Divider()
                    self.instructions
                        .textFooterStyle()
                    Button(action: self.action ?? { }) {
                        HStack {
                            Spacer()
                            Text("Log")
                            Spacer()
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding()
                    self.footer
                        .textFooterStyle()
                    LogDetailsView(details: self.logDetails)
                        .textDetailsStyle()
                    }
                }
                .cardViewModifier()
                .frame(minHeight: proxy.size.height)
            }
    }
}


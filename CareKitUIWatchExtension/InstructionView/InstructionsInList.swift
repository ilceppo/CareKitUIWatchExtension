//
//  InstructionsInList.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 08/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct InstructionsInList: View {
    
    public init(title: Text?, details: Text?, isCompleted: Bool, action: (() -> Void)? ){
        self.title = title
        self.details = details
        self.isCompleted = isCompleted
        self.action = action
    }
    
    let title: Text?
    let details: Text?
    var isCompleted: Bool
    let action: (() -> Void)?
    
    public var body: some View {
        
        HStack {
            VStack {
                HStack{
                    title
                    Spacer()
                }.padding(.horizontal)
                HStack{
                    details
                        .textDetailsStyle()
                    Spacer()
                }
                .padding([.horizontal,.bottom])
            }
            
            Button(action: action ?? {}){
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(SimpleButton())
            .frame(width: 30, height: 30, alignment: .leading)
            
        }
    }
}

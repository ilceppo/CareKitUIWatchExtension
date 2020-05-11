//
//  LogButtonInList.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 11/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct LogButtonInList: View {
    
    public init (title: Text?, details: Text?, action: (() -> Void)?){
        self.title = title
        self.details = details
        self.action = action
    }
    
    let title: Text?
    let details: Text?
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
                                   .textFooterStyle()
                                   Spacer()
                      
                }
                .padding([.horizontal, .bottom])
                
            }
            
            Button(action: action ?? {}){
                HStack{
                    Spacer()
                Text("Log")
                    .frame(alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                   Spacer()
                }
            }
            .buttonStyle(SimpleButton())
            .frame(width: 40, height: 20, alignment: .leading)
            .background(ColorStyles.buttonPrimaryColor)
            .cornerRadius(10)
        }
    }
}

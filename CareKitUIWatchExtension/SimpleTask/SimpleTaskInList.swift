//
//  SimpleTaskInList.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 08/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

struct SimpleTaskInList: View {
    let title: Text?
    let details: Text?
    
    @State var isCompleted: Bool
    
    var body: some View {
        
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
            
            Button(action: { self.isCompleted.toggle() }){
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(SimpleButton())
            .frame(width: 30, height: 30, alignment: .leading)
        }
    }
}

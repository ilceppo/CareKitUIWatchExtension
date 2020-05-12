//
//  ChecklistTaskInView.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 11/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

public struct ChecklistTaskInView: View {
    
    
    public init (details: Text?, title: Text?, footer: Text?, action: (() -> Void)?, itemList: [Bool], timeLabel: [Text?] ) {
           self.title = title
           self.details = details
           self.action = action
           self.itemList = itemList
            self.timeLabel = timeLabel
       }
    
    let title: Text?
    let details: Text?
    let itemList: [Bool]
    let action: (() -> Void)?
    let timeLabel: [Text?]
        
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
                    .padding([.horizontal])
                    HStack() {
                        ForEach(0 ..< itemList.count) { item in
                            VStack{
                                Button(action: self.action ?? { }){
                                    Image(systemName: self.itemList[item] ? "checkmark.circle.fill" : "circle")
                                }
                                .buttonStyle(SimpleButton())
                                
                                self.timeLabel[item]
                                    .textDetailsStyle()
                                
                            }
                            
                            
                        }
                        Spacer()
                    }
                }
            }
        }
}

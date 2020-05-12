//
//  GridListTaskInView.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 11/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI


public struct GridTaskInList: View {
    
    public init (details: Text?, title: Text?, footer: Text?, action: ((Int) -> Void)?, itemList: [GridTaskItem] ) {
           self.title = title
           self.details = details
           self.action = action
           self.itemList = itemList
       }
    
    let title: Text?
    let details: Text?
    let action: ((Int) -> Void)?
    let itemList: [GridTaskItem]
    

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
                        ForEach(0..<itemList.count, id: \.self) { index in
                            VStack{
                                Button(action: {self.action?(index)}) {
                                    Image(systemName: self.itemList[index].isCompleted ? "checkmark.circle.fill" : "circle")
                                }
                                .buttonStyle(SimpleButton())
                                
                                Text("\(self.itemList[index].label ?? "")")
                                    .textDetailsStyle()
                                Spacer()
                            }
                            
                        }
                        Spacer()
                    }
                }
            }
        }
}

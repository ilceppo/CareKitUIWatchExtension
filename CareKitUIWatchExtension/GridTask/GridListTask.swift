//
//  GridListTask.swift
//  CarekitUIComponents WatchKit Extension
//
//  Created by Elizaveta Diuchkova on 06/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI
public struct GridTaskItem: Hashable {
    let label: String
    var isCompleted: Bool
}

public struct GridListTask: View {
    
    public init (instructions: Text?, header: Text?, footer: Text?, action: (() -> Void)?, itemList: [GridTaskItem]) {
        self.instructions = instructions
        self.header = header
        self.footer = footer
        self.action = action
        self.itemList = itemList
    }
    
    let instructions: Text?
    let header: Text?
    let footer: Text?
    let itemList: [GridTaskItem]
    
    let action: (() -> Void)?
    
    
    var remaining: Int {
        var number = 0
        
        for item in itemList {
            if item.isCompleted != true {
                number += 1
            }
        }
        return number
    }
    
    public var body: some View {
        
        ScrollView{
            VStack{
                header?
                    .fontWeight(.bold)
                
                Text("\(remaining) remaining")
                
                Divider()
                instructions
                HStack{
                    ForEach(itemList, id: \.self) { item in
                        
                        VStack {
                            
                            Image(systemName: (!item.isCompleted ? "checkmark.circle" : "checkmark.circle.fill"))
                                .foregroundColor(ColorStyles.buttonPrimaryColor)
                                .onTapGesture {
                                    (self.action ?? {})
                            }
                            Text(item.label)
                        }
                    }
                }
                .padding(.horizontal)
            }
            footer
        }
        .cardViewModifier()
    }
}


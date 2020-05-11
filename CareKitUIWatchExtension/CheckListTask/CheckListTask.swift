//
//  CheckList.swift
//  CarekitUIComponents WatchKit Extension
//
//  Created by Matteo Cioppa on 06/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI

public struct CheckListItem: Hashable {
    let label: String
    var isCompleted: Bool
}

public struct CheckList: View {

    public init(instructions: Text?, header: Text?, footer: Text?, action: (() -> Void)?, itemList: [CheckListItem]) {
        self.instructions = instructions
        self.header = header
        self.footer = footer
        self.action = action
        self.itemList = itemList
    }
    
    let instructions: Text?
    let header: Text?
    let footer: Text?
    let itemList: [CheckListItem]
    
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

                ForEach(itemList, id: \.self) { item in
                    HStack() {
                        Text(item.label)
                        
                        Spacer()
                        
                        Image(systemName: (!item.isCompleted ? "checkmark.circle" : "checkmark.circle.fill"))
                            .foregroundColor(ColorStyles.buttonPrimaryColor)

                                    .onTapGesture {
                                           (self.action ?? {})()
                                       }
                    }
                    .padding(.horizontal)
                }
                footer
            }
        .cardViewModifier()
        }
    }
}

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
    
    public var body: some View {
        
        ScrollView{
            VStack{
                header?
                    .fontWeight(.bold)
                Divider()
                instructions
                footer

                ForEach(itemList, id: \.self) { item in
                    HStack() {
                        Text(item.label)
                        
                        Spacer()
                        
                        Image(systemName: (!item.isCompleted ? "checkmark.circle" : "checkmark.circle.fill"))
                                    .onTapGesture {
                                           (self.action ?? {})()
                                       }
                    }
                    .padding(.horizontal)
                }
                
                
                
            }                .padding()
                .background(Color.gray)
            .cornerRadius(20)
        }
    }
}

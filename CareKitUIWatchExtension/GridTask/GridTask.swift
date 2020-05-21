//
//  GridListTask.swift
//  CarekitUIComponents WatchKit Extension
//
//  Created by Elizaveta Diuchkova on 06/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI
public struct GridTaskItem: Hashable {
    public init(label: String, isCompleted: Bool) {
        self.label = label
        self.isCompleted = isCompleted
    }
    
    public var label: String?
    public var isCompleted: Bool
}

public struct GridTask: View {
    
    public init (instructions: Text?, header: Text?, footer: Text?, action: ((Int) -> Void)?, itemList: [GridTaskItem]) {
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
    
    let action: ((Int) -> Void)?
    
    
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
                    .textDetailsStyle()
                
                Divider()
                instructions
                HStack{
                     ForEach(0..<itemList.count, id: \.self)  { index in
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
                }
                .padding(.horizontal)
            }
            footer
        }
        //.cardViewModifier()
    }
}


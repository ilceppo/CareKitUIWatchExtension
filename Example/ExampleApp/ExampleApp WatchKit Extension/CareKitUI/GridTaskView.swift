//
//  GridTaskView.swift
//  ExampleApp WatchKit Extension
//
//  Created by Elizaveta Diuchkova on 11/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI
import CareKitUIWatchExtension



struct GridTaskView: View {
    
    @Binding var gridTaskItems: [GridTaskItem]
    
    var body: some View{
        GridTask(instructions: Text("Grid task instructions"), header: Text("Grid task"), footer: nil, action: { index in
            self.gridTaskItems[index].label = Date().getFormattedDate()
            self.gridTaskItems[index].isCompleted.toggle()
        } , itemList: gridTaskItems)
    }
}



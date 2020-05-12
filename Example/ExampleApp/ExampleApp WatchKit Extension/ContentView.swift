//
//  ContentView.swift
//  ExampleApp WatchKit Extension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI
import CareKitUIWatchExtension

struct ContentView: View {
    
    @State var isCompletedSimpleTask = false
    @State var isCompletedIntsructionTask = false
    @State var events: [String] = []
    
    @State var gridTaskItems: [GridTaskItem] = [GridTaskItem(label: "1:00 PM", isCompleted: false), GridTaskItem(label: "", isCompleted: false)]
    @State var checklistTaskItems: [CheckListItem] = [CheckListItem(label: "Breakfast", isCompleted: false), CheckListItem(label: "Dinner", isCompleted: false)]
    
    
    var body: some View {
        List {
            NavigationLink(destination: SimpleTaskView()) {
                SimpleTaskInList(title: Text("Simple task"), details: Text("At 7AM"), isCompleted: isCompletedSimpleTask, action: {
                    self.isCompletedSimpleTask.toggle()
                })
            }
            
            NavigationLink(destination: InstructionTaskView()) {
                InstructionsInList(title: Text("Instructions"), details: Text("From 8AM to 9AM"), isCompleted: isCompletedIntsructionTask, action: {
                    self.isCompletedIntsructionTask.toggle()
                })
            }
            
            NavigationLink(destination: LogTaskView(events: $events)) {
                LogButtonInList(title: Text("Log Button"), details: Text("just log"), action: {
                    let date = Date().getFormattedDate()
                    self.events.append(date)
                } )
            }
            
            NavigationLink(destination: GridTaskView(gridTaskItems: $gridTaskItems)){
                GridTaskInList(details: Text("details"), title: Text("Grid"), footer: nil, action: { index in
                    self.gridTaskItems[index].label = Date().getFormattedDate()
                    self.gridTaskItems[index].isCompleted.toggle()
                }, itemList: gridTaskItems)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

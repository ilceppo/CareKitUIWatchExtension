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
    @State var isCompletedSimpleTask2 = false
    @State var isCompletedIntsructionTask = false
    @State var events: [String] = []
    
    @State var gridTaskItems: [GridTaskItem] = [GridTaskItem(label: "8:00 AM", isCompleted: false),
                                                GridTaskItem(label: "2:00 PM", isCompleted: false)]
    @State var checklistTaskItems: [CheckListItem] = [CheckListItem(label: "Breakfast", isCompleted: false), CheckListItem(label: "Dinner", isCompleted: false)]
    
    
    var body: some View {
        List {
            SimpleTask(header: Text("Irrigate your plant"), details: Text("9:00 AM to 10:00 AM"), footer: nil, action: {
                self.isCompletedSimpleTask = !self.isCompletedSimpleTask
            }, isCompleted: isCompletedSimpleTask)
                .padding(.vertical)
            
            SimpleTask(header: Text("Party hard with your plants"), details: Text("All day"), footer: nil, action: {
                self.isCompletedSimpleTask2 = !self.isCompletedSimpleTask2
            }, isCompleted: isCompletedSimpleTask2)
                .padding(.vertical)
            
            GridTask(instructions: nil, header: Text("Talk to your plant"), footer: nil, action: { index in
                    self.gridTaskItems[index].label = Date().getFormattedDate()
                    self.gridTaskItems[index].isCompleted.toggle()
            } , itemList: gridTaskItems)
                .padding(.vertical)
            
            Instructions(instructions: Text("Do this"), header: Text("Do this"), details: nil, footer: nil, action: {
                self.isCompletedIntsructionTask = !self.isCompletedIntsructionTask
            }, isCompleted: isCompletedIntsructionTask)
                .padding(.vertical)
            
            NavigationLink(destination: LogTaskView(events: $events)) {
                LogButtonInList(title: Text("Felt the plant staring at me"), details: nil, action: {
                    let date = Date().getFormattedDate()
                    self.events.append(date)
                } )
            }
        
            
        }.listStyle(CarouselListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

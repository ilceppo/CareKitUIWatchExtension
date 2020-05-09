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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

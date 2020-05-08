//
//  ContentView.swift
//  ExampleApp WatchKit Extension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            NavigationLink(destination: SimpleTaskView()) {
                Text("Simple task")
            }
            
            NavigationLink(destination: InstructionTaskView()) {
                Text("Instruction task")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

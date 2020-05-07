//
//  SimpleTask.swift
//  ExampleApp WatchKit Extension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI
import CareKitUIWatchExtension

struct SimpleTaskView: View {
    @State var isCompleted = false
    
    var body: some View {
        SimpleTask(instructions: Text("Swallow a pill with one glass of water"), header: Text("Heart pill"), footer: nil, action: {
            self.isCompleted = !self.isCompleted
        }, isCompleted: isCompleted)
    }
}

struct SimpleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTaskView()
    }
}

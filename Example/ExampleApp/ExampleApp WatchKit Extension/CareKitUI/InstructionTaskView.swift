//
//  InstructionTaskView.swift
//  ExampleApp WatchKit Extension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI
import CareKitUIWatchExtension

struct InstructionTaskView: View {
    @State var isCompleted: Bool = false
    
    var body: some View {
        Instructions(instructions: Text("Do this"), header: Text("Do this"), details: nil, footer: nil, action: {
            self.isCompleted = !self.isCompleted
        }, isCompleted: isCompleted)
    }
}

struct InstructionTaskView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionTaskView()
    }
}

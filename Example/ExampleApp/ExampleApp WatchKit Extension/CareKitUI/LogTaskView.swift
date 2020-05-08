//
//  LogTaskView.swift
//  ExampleApp WatchKit Extension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import SwiftUI
import CareKitUIWatchExtension

struct LogTaskView: View {
    @State var events: [String] = []
    
    var body: some View {
        
        ScrollView {
            ButtonLog(instructions: Text("..."), header: Text("..."), footer: nil, action: {
                print("a")
                let date = Date().getFormattedDate(format: "HH:mm")
                self.events.append(date.description)
            }, logDetails: events, details: Text("details"))
        }
        
    }
}

struct LogTaskView_Previews: PreviewProvider {
    static var previews: some View {
        LogTaskView()
    }
}

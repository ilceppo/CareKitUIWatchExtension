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
    @Binding var events: [String]
    
    var body: some View {
        ButtonLog(instructions: Text("Log every time you felt observed"), header: Text("Felt the plant staring at me"), footer: nil, action: {
            let date = Date().getFormattedDate()
            self.events.append(date)
        }, logDetails: events, details: Text("All day"))
    }
}

struct LogTaskView_Previews: PreviewProvider {
    static var previews: some View {
        LogTaskView(events: .constant([]))
    }
}

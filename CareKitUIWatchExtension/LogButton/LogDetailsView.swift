//
//  LogDetailsView.swift
//  CareKitUIWatchExtension
//
//  Created by Elizaveta Diuchkova on 06/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

struct LogDetailsView: View {
    var details: [String]?
    
    var body: some View {
        ForEach(details ?? [], id: \.self) { detail in
            HStack{
                Image(systemName: "clock")
                Text(detail)
            }
        }
    }
}

//struct LogDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogDetailsView()
//    }
//}

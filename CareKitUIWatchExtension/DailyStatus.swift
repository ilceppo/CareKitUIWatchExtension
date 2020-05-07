//
//  DailyStatus.swift
//  CareKitUIWatchExtension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Elizaveta Diuchkova. All rights reserved.
//

import SwiftUI

struct DayStatus: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(ColorStyles.buttonPrimaryColor)
                .padding()
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(ColorStyles.buttonSecondaryColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            .padding()
        }.cardViewModifier()
    }
}

/*struct DayStatus_Previews: PreviewProvider {
    static var previews: some View {
        DayStatus(progress: .constant(0.28))
    }
}*/

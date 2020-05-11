//
//  DateFormat+Date.swift
//  ExampleApp WatchKit Extension
//
//  Created by Matteo Cioppa on 07/05/2020.
//  Copyright © 2020 Matteo Cioppa. All rights reserved.
//

import Foundation

extension Date {
   func getFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateStyle = .none
        dateformat.timeStyle = .short
        return dateformat.string(from: self)
    }
}

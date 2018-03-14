//
//  Public.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Public functions
extension WeekdayPicker {
    
    /// Set DatePicker to date recieved as parameter
    public func setToDate(_ date: Date) {
        setCustomDate(date: date)
        self.delegated?.weekdayPickerDateChanged(date)
    }
    
    /// Reset desired or all component(s)
    public func resetComponent(component aComponent: ComponentIndex? = nil,
                               resetAll: Bool = false) {
        if let component = aComponent {
            self.selectRow(0, inComponent: component)
        }
        
        if resetAll {
            self.selectRow(0, inComponent: .weekday)
            self.selectRow(0, inComponent: .day)
            self.selectRow(0, inComponent: .month)
            self.selectRow(0, inComponent: .year)
        }
    }
}

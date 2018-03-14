//
//  Update.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Update functions
extension WeekdayPicker {
    
    internal func updateDays() {
        // Generate days for current month and year
        self.days = dayList(month: self.selectedRow(inComponent: .month),
                            year: self.selectedRow(inComponent: .year))
        
        // Update number of days
        self.reloadComponent(.day)
    }
    
    internal func applyWeekday() {
        let allIndexes = getDayIndexes(currentDate: createDateFromSelected())
        if let allWeekdays = self.dateFormatter.shortWeekdaySymbols {
            let index: Int = findIndex(elem: allWeekdays[allIndexes.weekday],
                                       list: self.weekdays)
            self.selectRow(index, inComponent: .weekday)
        }
    }
}

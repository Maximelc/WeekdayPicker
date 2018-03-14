//
//  Helper.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Helper
extension WeekdayPicker {
    
    internal func getDayIndexes(currentDate: Date) -> (weekday: Int, day: Int, month: Int, year: Int) {
        let dateComponents = self.calendar.dateComponents([.year, .month, .weekday, .day], from: currentDate)
        
        if let day = dateComponents.day, let weekday = dateComponents.weekday,
            let month = dateComponents.month, let year = dateComponents.year {
            
            let currentDay: Int = findIndex(elem: day.toString(), list: self.days)
            let currentYear: Int = findIndex(elem: year.toString(), list: self.years)
            let weekdayIndex: Int = findIndex(elem: self.weekdays[weekday - 1],
                                              list: self.weekdays)
            return (weekdayIndex, currentDay, month, currentYear)
        }
        return (0, 0, 0, 0)
    }
    
    /// Create date from all selected indexes
    internal func createDateFromSelected() -> Date {
        let dayStr: String = days[self.selectedRow(inComponent: .day)]
        let monthStr: String = months[self.selectedRow(inComponent: .month)]
        let yearStr: String = years[self.selectedRow(inComponent: .year)]
        let dateStr: String = "\(dayStr) \(monthStr) \(yearStr)"
        
        guard let date = self.dateFormatter.date(from: dateStr) else {
            fatalError("ERROR: Date conversion failed due to mismatched format.")
        }
        return date
    }
    
    /// Select custom date
    internal func setCustomDate(date aDate: Date) {
        let allIndexes = getDayIndexes(currentDate: aDate)
        if let allWeekdays = self.dateFormatter.shortWeekdaySymbols {
            let weekdayIndex: Int = findIndex(elem: allWeekdays[allIndexes.weekday],
                                              list: self.weekdays)
            self.selectRow(weekdayIndex, inComponent: .weekday)
            self.selectRow(allIndexes.day, inComponent: .day)
            self.selectRow(allIndexes.month - 1, inComponent: .month)
            self.selectRow(allIndexes.year, inComponent: .year)
        }
        updateDays()
    }
    
    /// Get number of day for month and year
    internal func numberOfDay(month: Int, year: Int) -> Int {
        let dateComponents: DateComponents = DateComponents(year: year, month: month)
        if let date: Date = self.calendar.date(from: dateComponents),
            let range: Range<Int> = self.calendar.range(of: .day, in: .month, for: date) {
            return range.count
        }
        return 0
    }
    
    internal func findIndex(elem: String, list: [String]) -> Int {
        if let offset = list.index(where: { $0 == elem }) {
            return offset
        }
        return 0
    }
}

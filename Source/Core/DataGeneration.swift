//
//  Generation.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Data generation
extension WeekdayPicker {
    
    /// Generate list of days numbers.
    internal func dayList() -> [String] {
        return (1...31).map { $0.toString() }
    }
    
    /// Get list of days starting by monday
    internal func weekdayList() -> [String] {
        let numDays: Int = self.calendar.weekdaySymbols.count
        let first: Int = self.calendar.firstWeekday - 1
        let end: Int = first + numDays - 1
        return (first...end).map { self.calendar.shortWeekdaySymbols[$0 % numDays] }
    }
    
    /// Genrate day number for given month and year
    internal func dayList(month: Int, year: Int) -> [String] {
        if let currentYear: Int = Int(self.years.first ?? 0.toString()) {
            let nbDays: Int = self.numberOfDay(month: month + 1, year: year + currentYear)
            var tmpList: [String] = [String]()
            for index in 1...nbDays {
                tmpList.append(index.toString())
            }
            return tmpList
        }
        return [String]()
    }
    
    /// Get list of months
    internal func monthList() -> [String] {
        return self.dateFormatter.shortMonthSymbols
    }
    
    /// Get year list
    internal func yearList() -> [String] {
        if let currentYear = self.calendar.dateComponents([.year], from: Date()).year {
            var tmpList: [String] = [String]()
            for current in currentYear...(currentYear + 10) {
                tmpList.append(current.toString())
            }
            return tmpList
        }
        return [String]()
    }
}

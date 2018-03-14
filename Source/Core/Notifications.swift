//
//  Notifications.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Notifications functions
extension WeekdayPicker {
    
    internal func setupNotifications() {
        self.notificationCenter.addObserver(self, selector: #selector(weekdayUpdate), name: .weekday, object: nil)
        self.notificationCenter.addObserver(self, selector: #selector(dayUpdate), name: .day, object: nil)
        self.notificationCenter.addObserver(self, selector: #selector(monthUpdate), name: .month, object: nil)
        self.notificationCenter.addObserver(self, selector: #selector(yearUpdate), name: .year, object: nil)
    }
    
    internal func fireNotification(selectedComponent aValue: ComponentIndex) {
        self.notificationCenter.post(name: aValue.notification, object: nil)
    }
    
    internal func removeNotifications() {
        self.notificationCenter.removeObservers(self, listName: [.weekday, .day, .month, .year])
    }
}

// MARK: - Notifications Actions
extension WeekdayPicker {
    
    @objc
    private func weekdayUpdate() {
        print("Update day")
        
        let currentWeekday = self.weekdays[self.selectedRow(inComponent: .weekday)]
        
        let oldIndex = findIndex(elem: self.weekdayHistoryList.last ?? "", list: self.weekdays)
        let newIndex = findIndex(elem: currentWeekday, list: self.weekdays)
        
        let diffIndex: Int = newIndex - oldIndex
        
        if !(oldIndex == newIndex || diffIndex == 0) {
            
            let currentDayIndex: Int = self.selectedRow(inComponent: .day)
            let currentMonthIndex: Int = self.selectedRow(inComponent: .month)
            let currentYearIndex: Int = self.selectedRow(inComponent: .year)
            
            if currentDayIndex < self.days.count - 1 {
                print("Cas 1")
                self.selectRow(currentDayIndex + diffIndex, inComponent: .day)
            } else if currentMonthIndex < self.months.count - 1 {
                print("Cas 2")
                self.selectRow(0, inComponent: .day)
                self.selectRow(currentMonthIndex + diffIndex, inComponent: .month)
            } else if currentYearIndex < self.years.count - 1 {
                print("Cas 3")
                self.selectRow(0, inComponent: .day)
                self.selectRow(0, inComponent: .month)
                self.selectRow(currentYearIndex + diffIndex, inComponent: .year)
            } else {
                print("Cas 4")
                self.selectRow(0, inComponent: .weekday)
                self.selectRow(0, inComponent: .day)
                self.selectRow(0, inComponent: .month)
                self.selectRow(0, inComponent: .year)
            }
        }
    }
    
    @objc
    private func dayUpdate() {
        applyWeekday()
    }
    
    @objc
    private func monthUpdate() {
        updateDays()
        applyWeekday()
    }
    
    @objc
    private func yearUpdate() {
        updateDays()
        applyWeekday()
    }
}

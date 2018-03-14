//
//  Protocols.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - UIPickerViewDelegate
extension WeekdayPicker: UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let componentIndex = ComponentIndex(rawValue: component) {
            fireNotification(selectedComponent: componentIndex)
        }
        self.currentDate = createDateFromSelected()
        
        // Save weekday TMP
        if self.weekdayHistoryList.count > 1 {
            self.weekdayHistoryList.removeFirst()
        }
        
        let currentWeekday = self.weekdays[self.selectedRow(inComponent: .weekday)]
        self.weekdayHistoryList.append(currentWeekday)
        
        self.delegated?.weekdayPickerDateChanged(self.currentDate)
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let componentIndex = ComponentIndex(rawValue: component) {
            switch componentIndex {
            case .weekday: return self.weekdays[row]
            case .day: return self.days[row]
            case .month: return self.months[row]
            case .year: return self.years[row]
            }
        }
        return nil
    }
}

// MARK: - UIPickerViewDataSource
extension WeekdayPicker: UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let componentIndex = ComponentIndex(rawValue: component) {
            switch componentIndex {
            case .weekday: return self.weekdays.count
            case .day: return self.days.count
            case .month: return self.months.count
            case .year: return self.years.count
            }
        }
        return 0
    }
}

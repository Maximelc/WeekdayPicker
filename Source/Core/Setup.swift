//
//  Setup.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Setup functions
extension WeekdayPicker {
    
    /// Setup function
    internal func setup() {
        setupProtocols()
        setupNotifications()
        
        self.perform(#selector(saveFirstWeekday), with: nil, afterDelay: 1.0)
    }
    
    /// Setup protocols for WeekdayPicker
    private func setupProtocols() {
        self.delegate = self
        self.dataSource = self
    }
    
    @objc
    private func saveFirstWeekday() {
        print(createDateFromSelected())
        
        // Save weekday TMP
        let currentWeekday = self.weekdays[self.selectedRow(inComponent: .weekday)]
        self.weekdayHistoryList.append(currentWeekday)
    }
}

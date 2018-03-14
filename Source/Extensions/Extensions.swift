//
//  Extensions.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Int
extension Int {
    
    /// Convert int to string value
    func toString() -> String {
        return "\(self)"
    }
}

// MARK: - Notification.Name
extension Notification.Name {
    
    /// Notification named day
    static let day = Notification.Name("day")
    
    /// Notification named weekday
    static let weekday = Notification.Name("weekday")
    
    /// Notification named month
    static let month = Notification.Name("month")

    /// Notification named year
    static let year = Notification.Name("year")
}

// MARK: - NotificationCenter
extension NotificationCenter {
    
    /// Remove list of notifications
    func removeObservers(_ observer: Any, listName: [NSNotification.Name]) {
        for notificationName in listName {
            self.removeObserver(observer, name: notificationName, object: nil)
        }
    }
}

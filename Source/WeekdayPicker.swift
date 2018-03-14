//
//  WeekdayPicker.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 01/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

/// WeekdayPicker is a custom UIDatePicker with weekdays.
public final class WeekdayPicker: UIPickerView {
    
    // MARK: - Public
    /// Delegate method
    public weak var delegated: WeekdayPickerDelegate?
    
    /// Current selected date
    public internal(set) var currentDate: Date?
    
    /// Component Index enum
    public enum ComponentIndex: Int {
        
        /// Component weekday index 0
        case weekday = 0

        /// Component day index 1
        case day = 1
        
        /// Component month index 2
        case month = 2
        
        /// Component year index 3
        case year = 3
        
        /// Return the associated notification
        var notification: Notification.Name {
            switch self {
            case .weekday: return .weekday
            case .day: return .day
            case .month: return .month
            case .year: return .year
            }
        }
    }
    
    // MARK: - Lazy
    internal lazy var weekdays: [String] = weekdayList()
    internal lazy var days: [String]     = dayList()
    internal lazy var months: [String]   = monthList()
    internal lazy var years: [String]    = yearList()
    internal lazy var dateFormatter: DateFormatter = {
        let dateformat: DateFormatter = DateFormatter()
        dateformat.calendar = .current
        dateformat.timeZone = TimeZone(abbreviation: "UTC")
        dateformat.dateFormat = "d MMM yyyy"
        return dateformat
    }()
    
    // MARK: - Privates
    internal let calendar: Calendar = Calendar.current
    internal let notificationCenter: NotificationCenter = NotificationCenter.default
    internal var weekdayHistoryList: [String] = [String]() //tmp
    
    // MARK: - Life cycle
    /// Init function take frame
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    /// Init function coder
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// De-init function
    deinit {
        removeNotifications()
    }
}

//
//  Delegate.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 14/03/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import Foundation

/**
 * The delegate of a WeekdayPicker object must adopt the WeekdayPickerDelegate protocol. Optional methods of the protocol allow the delegate to get informations.
 */
public protocol WeekdayPickerDelegate: AnyObject {
    
    /// Informs the observed object that the date just changed.
    func weekdayPickerDateChanged(_ date: Date?)
}

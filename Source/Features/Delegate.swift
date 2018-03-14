//
//  Delegate.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 14/03/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import Foundation

public protocol WeekdayPickerDelegate: AnyObject {
    
    func weekdayPickerDateChanged(_ date: Date?)
}

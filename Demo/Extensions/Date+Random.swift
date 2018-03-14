//
//  Date+Random.swift
//  Demo
//
//  Created by Maxime Le Coat on 14/03/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import Foundation

extension Date {

    /// Generate a random date
    static func random() -> Date {
        return Date.randomWithinDaysAfterToday(Int.random(1, 5000))
    }
    
    static func randomWithinDaysAfterToday(_ days: Int) -> Date {
        let today = Date()
        let earliest = today.addingTimeInterval(TimeInterval(days*24*60*60))
        
        return Date.random(between: today, and: earliest)
    }
    
    static func random(between initial: Date, and final: Date) -> Date {
        let interval = final.timeIntervalSince(initial)
        let randomInterval = TimeInterval(arc4random_uniform(UInt32(interval)))
        return initial.addingTimeInterval(randomInterval)
    }
    
    /* Taken from SwiftRandom */
}

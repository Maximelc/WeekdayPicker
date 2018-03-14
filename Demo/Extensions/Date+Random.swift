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
        return Date(timeIntervalSince1970:
            TimeInterval(arc4random_uniform(UInt32.max)))
    }
    /* Taken from SwiftRandom */
}

//
//  Overload.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 07/03/2018.
//  Copyright © 2018 Maxime Le Coat. All rights reserved.
//

import UIKit

// MARK: - Custom overload
extension WeekdayPicker {
    
    func reloadComponent(_ component: ComponentIndex) {
        self.reloadComponent(component.rawValue)
    }
    
    func selectedRow(inComponent component: ComponentIndex) -> Int {
        return self.selectedRow(inComponent: component.rawValue)
    }
    
    func selectRow(_ row: Int, inComponent component: ComponentIndex) {
        self.selectRow(row < 0 ? 0 : row,
                       inComponent: component.rawValue, animated: true)
    }
}

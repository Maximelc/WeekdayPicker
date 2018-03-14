//
//  UIButton+Layout.swift
//  Demo
//
//  Created by Maxime Le Coat on 14/03/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    
    /// Apply default configuration
    func defaultConfiguration(title: String, coordinates: CGPoint, action aSelector: Selector, owner: Any) {

        // Position
        self.frame = CGRect(origin: coordinates,
                            size: CGSize(width: 100, height: 50))
        
        // Title
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        
        // Layer
        self.layer.borderWidth = 0.6
        self.layer.borderColor = UIColor.black.cgColor
        
        // Action
        self.addTarget(owner, action: aSelector, for: .touchDown)
    }
}

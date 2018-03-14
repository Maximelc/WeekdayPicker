//
//  HomeViewController.swift
//  WeekdayPicker
//
//  Created by Maxime Le Coat on 14/03/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit
import WeekdayPicker

final class HomeViewController: UIViewController {
    
    // MARK: - Privates
    private var dateLabel: UILabel?
    private var weekdayPicker: WeekdayPicker?
    
    // MARK: - Application Lifecyle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - HomeViewController
extension HomeViewController {
    
    // MARK: - Configurations
    fileprivate func setup() {
        setupNavigationBar()
        setupDesign()
    }
    
    // MARK: - Privates Functions
    private func setupNavigationBar() {
        self.title = "WeekdayPicker"
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .automatic
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    private func setupDesign() {
        setupButtons()
        setupDatePicker()
        setupLabel()
    }
    
    private func setupButtons() {

        let posY: CGFloat = 320.0
        let viewWidth: CGFloat = self.view.frame.width
        
        // Random button
        let randomButton: UIButton = UIButton()
        randomButton.defaultConfiguration(title: "Random",
                                          coordinates: CGPoint(x: 50, y: posY),
                                          action: #selector(randomDate), owner: self)
        self.view.addSubview(randomButton)
        
        // Reset button
        let resetButton: UIButton = UIButton()
        resetButton.defaultConfiguration(title: "Reset",
                                         coordinates: CGPoint(x: viewWidth - 150, y: posY),
                                         action: #selector(resetPicker), owner: self)
        self.view.addSubview(resetButton)
        /*
         why 150 for x ?
         button width = 100
         margin = 50
         */
    }
    
    private func setupDatePicker() {
        
        // Create our object
        self.weekdayPicker = WeekdayPicker()
        self.weekdayPicker?.delegated = self
        
        if let customPicker = self.weekdayPicker {
            
            // Apply frame
            customPicker.frame = CGRect(origin: CGPoint(x: 0, y: 150),
                                        size: CGSize(width: self.view.frame.size.width,
                                                     height: 150))
            
            // Set first date to show
            customPicker.setToDate(Date())
            
            // Add picker to current view
            self.view.addSubview(customPicker)
        }
    }
    
    private func setupLabel() {
        
        // Date label
        self.dateLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 400),
                                               size: CGSize(width: self.view.frame.size.width,
                                                            height: 30)))
        if let dateLabel = self.dateLabel {
            dateLabel.text = nil
            dateLabel.textAlignment = .center
            self.view.addSubview(dateLabel)
        }
    }
    
    // MARK: - Actions
    @objc
    private func randomDate() {
        if let customPicker = self.weekdayPicker {
            
            // Set picker a random date
            customPicker.setToDate(Date.random())
        }
    }
    
    @objc
    private func resetPicker() {
        if let customPicker = self.weekdayPicker {
            
            // Reset picker to current date
            customPicker.setToDate(Date())
        }
    }
}

// MARK: - WeekdayPickerDelegate
extension HomeViewController: WeekdayPickerDelegate {
    
    func weekdayPickerDateChanged(_ date: Date?) {
        if let dateLabel = self.dateLabel, let date = date {
            dateLabel.text = "\(date)"
        }
    }
}

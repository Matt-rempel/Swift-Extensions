//
//  Extensions.swift
//  Swift Extensions
//
//  Created by Matthew Rempel on 2018-02-24.
//  Copyright © 2018 Matthew Rempel. All rights reserved.
//

import Foundation
import UIKit

extension Bool {
    // Toggle the value of the boolean
    mutating func toggle() {
        self = !self
    }
}

extension UIView {
    // Give an iOS 11 App Store card view look to a UIView
    func cardDesign() {
        // Add the shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        // Move the shadow down and right 5%
        self.layer.shadowOffset = CGSize(width: self.frame.width * 0.05, height: self.frame.height * 0.05)
        self.layer.shadowRadius = 10
        self.layer.shouldRasterize = true
        
        // Round the view corners
        self.layer.cornerRadius = 10.0
    }
}

extension UIApplication {
    // Change the background color of the status bar
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

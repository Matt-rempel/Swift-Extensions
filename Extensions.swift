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

extension String {
    func getCharAtIndex(pos: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: pos)]
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


extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 17.0)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}

extension Array where Element:Card {
    mutating func removeDuplicates() {
        var result:[Card]! = []
        for value in self {
            let currentValId = value.cardId
            var isInTheArrayAlready = false
            for i in result {
                isInTheArrayAlready = (i.cardId == currentValId)
                if isInTheArrayAlready{
                    break
                }
            }
            if !isInTheArrayAlready {
                result.append(value)
            }
        }
        
        self = result as! Array<Element>
    }
}

extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        if let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return normalizedImage
        } else {
            return self
        }
    }
}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


extension UIImage {
    
    func compressImage() -> UIImage? {
        // Reducing file size to a 10th
        var actualHeight: CGFloat = self.size.height
        var actualWidth: CGFloat = self.size.width
        let maxHeight: CGFloat = 1136.0
        let maxWidth: CGFloat = 640.0
        var imgRatio: CGFloat = actualWidth/actualHeight
        let maxRatio: CGFloat = maxWidth/maxHeight
        var compressionQuality: CGFloat = 0.5
        
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            } else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            } else {
                actualHeight = maxHeight
                actualWidth = maxWidth
                compressionQuality = 1
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        guard let imageData = img.jpegData(compressionQuality: compressionQuality) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

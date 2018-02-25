# Swift-Extensions
A collection of my favourite extensions to use with Swift and UIKit

## Usage
Download the Extensions.swift file and add it to your existing Xcode project. Remember to add it to all targets!

## Bool
### toggle()
   ```swift
        // Bool
        var myBool = true
        myBool.toggle()
        print(myBool) // false
   ```
  
## UIView
### cardDesign()
   ```swift
        // UIView
        let myView = UIView()
        myView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 350)
        myView.backgroundColor = .white
        myView.center = self.view.center
        myView.cardDesign()
        self.view.addSubview(myView)
   ```
   ![Screenshot](README%20Images/shadow.png)

## UIApplication
### statusBarView
   ```swift
        // UIApplication
        UIApplication.shared.statusBarView?.backgroundColor = .red
   ```
  

//
//  UIColor.swift
//  DevTools
//
//  Created by Erik Bean on 6/15/17.
//

import Foundation

extension UIColor {
    
    /// Create a color from Hex
    class func rgb(fromHex: Int) -> UIColor {
        // Function found here
        // https://stackoverflow.com/questions/33942483/swift-extension-example
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

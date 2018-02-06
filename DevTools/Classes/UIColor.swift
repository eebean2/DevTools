/*
 * UIColor Extention
 *
 * Created by Erik Bean on 6/15/17
 *
 * You are free to unlock this file and edit as you wish
 * This file is yours to extend, manipulate, or change
 * in any way, shape, or form. Most of this code is not
 * mine to begin with, and only centralized here to give
 * a more swifty experiance!
 *
 *                                              - Erik
 */

import Foundation

extension UIColor {
    
    /// Create a color from Hex
    public class func rgb(fromHex: Int) -> UIColor {
        // Function found here
        // https://stackoverflow.com/questions/33942483/swift-extension-example
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

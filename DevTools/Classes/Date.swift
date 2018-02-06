/*
 * Date Extention
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

extension Date {
    /// Convert the datee to a string with format "MMMM dd yyyy"
    public func toString() -> String {
        /*
         Based on the following code
         https://stackoverflow.com/questions/38564893/date-formatting-not-working-in-swift-3
        */
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: self)
    }
    
    /// Convert the date to a string with the given format
    public func toString(with format: String) -> String {
        /*
            Based on the following code
            https://stackoverflow.com/questions/38564893/date-formatting-not-working-in-swift-3
        */
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Attempt to create a date from a string with the given format
    public static func from(_ string: String, format: String) -> Date? {
        /*
            Based on the following code
            https://stackoverflow.com/questions/33277970/how-to-convert-string-to-date-to-string-in-swift-ios
        */
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
    
    /// Attempt to create a date from a string with format "MMMM dd yyyy"
    public static func from(_ string: String) -> Date? {
        /*
         Based on the following code
         https://stackoverflow.com/questions/38564893/date-formatting-not-working-in-swift-3
         */
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.date(from: string)
    }
}

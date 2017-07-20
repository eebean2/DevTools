//
//  String.swift
//  DevTools
//
//  Created by Erik Bean on 6/15/17.
//

import Foundation

/// A line of characters to verify a possible email string
public typealias EmailRegex = String

extension String {
    /// Checks if the string is a possible email
    public var isEmail: Bool {
        // EmailRegex found here
        // http://emailregex.com
        
        let regex: EmailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    /// Checks if the string is a possible email using a set predicate
    public func isEmail(with predicate: NSPredicate) -> Bool {
        return predicate.evaluate(with: self)
    }
    
    /// Checks if the string is a possible email using a set Email Regex
    public func isEmail(with regex: EmailRegex) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    /// Turns the string into a plural
    public func pluralize(_ needsApostrophe: Bool = false, isName: Bool = false) -> String {
        // Expanded idea of the function found here
        // https://gist.github.com/albertbori/0faf7de867d96eb83591
        
        if self.characters.last == "Y" || self.characters.last == "y" {
            if isName {
                if needsApostrophe {
                    if self == self.lowercased() {
                        return "\(self)'s"
                    } else {
                        return "\(self)'S"
                    }
                } else {
                    if self == self.lowercased() {
                        return "\(self)s"
                    } else {
                        return "\(self)S"
                    }
                }
            } else {
                let s = self.characters.dropLast()
                if self == self.lowercased() {
                    return "\(s)ies"
                } else {
                    return "\(s)IES"
                }
            }
        } else if self.characters.last == "S" || self.characters.last == "s" && !isName {
            return self
        } else {
            if needsApostrophe {
                if self == self.lowercased() {
                    return "\(self)'s"
                } else {
                    return "\(self)'S"
                }
            } else {
                if self == self.lowercased() {
                    return "\(self)s"
                } else {
                    return "\(self)S"
                }
            }
        }
    }
    
    /// Replace a given string with another string
    public func replace(target: String, with: String) -> String {
        // Function found here
        // https://stackoverflow.com/questions/33942483/swift-extension-example
        return self.replacingOccurrences(of: target, with: with)
    }
    
    /// Remove all empty spaces
    public func removeWhitespace() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    /// Attempt to create a date from the current string with the given format
    public func toDate(format: String) -> Date? {
        /*
         Based on the following code
         https://stackoverflow.com/questions/33277970/how-to-convert-string-to-date-to-string-in-swift-ios
        */
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    /// Attempt to create a date from the current string with format "MMMM dd yyyy"
    public func toDate() -> Date? {
        /*
         Based on the following code
         https://stackoverflow.com/questions/38564893/date-formatting-not-working-in-swift-3
         */
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.date(from: self)
    }
}

/*
 * UIAlertController Extention
 * UIAlertAction Extention
 *
 * Created by Erik Bean on 7/12/17
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

extension UIAlertController {
    /// Add an array of actions to the alert controller
    public func addActions(_ actions: [UIAlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
}

extension UIAlertAction {
    
    /// A generic "Ok" action
    public static func okAction(_ handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: "Ok", style: .default, handler: handler)
    }
}

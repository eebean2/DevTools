//
//  UIAlertController.swift
//  Pods
//
//  Created by Erik Bean on 7/12/17.
//
//

import Foundation

extension UIAlertController {
    /// Add an array of actions to the alert controller
    public func addActions(_ actions: [UIAlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
}

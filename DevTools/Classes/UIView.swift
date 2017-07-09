//
//  UIView.swift
//  DevTools
//
//  Created by Erik Bean on 7/3/17.
//

import Foundation

extension UIView {
    
    /// Add a view and send it to the back
    public func addToBack(_ view: UIView) {
        self.addSubview(view)
        self.sendSubview(toBack: view)
    }
}

/*
 * UIView Extention
 *
 * Created by Erik Bean on 7/3/17
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

extension UIView {
    
    /// Add a view and send it to the back
    public func addToBack(_ view: UIView) {
        addSubview(view)
        sendSubview(toBack: view)
    }
    
    /// Round one or more corners with the given radii
    public func round(corner: UIRectCorner, cornerRadii radii: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [corner], cornerRadii: CGSize(width: radii, height: radii))
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

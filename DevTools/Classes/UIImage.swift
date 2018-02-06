/*
 * UIImage Extention
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

extension UIImage {
    
    /// Create PNG Data from the current image
    public func pngRepresentation() -> Data? {
        return UIImagePNGRepresentation(self)
    }
    
    /// Create JPEG Data from the current image
    public func jpegRepresentation(_ compressionQuality: CGFloat) -> Data? {
        return UIImageJPEGRepresentation(self, compressionQuality)
    }
}

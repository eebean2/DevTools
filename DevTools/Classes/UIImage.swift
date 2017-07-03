//
//  UIImage.swift
//  Pods
//
//  Created by Erik Bean on 6/15/17.
//
//

import Foundation

extension UIImage {
    
    /// Create PNG Data from the current image
    func pngRepresentation() -> Data? {
        return UIImagePNGRepresentation(self)
    }
    
    /// Create JPEG Data from the current image
    func jpegRepresentation(_ compressionQuality: CGFloat) -> Data? {
        return UIImageJPEGRepresentation(self, compressionQuality)
    }
}

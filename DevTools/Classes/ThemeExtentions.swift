//
//  ThemeExtentions.swift
//  Pods
//
//  Created by Erik Bean on 8/16/17.
//

import Foundation

/*
 *  This class is still in development
 */

protocol UIThemeProtocol {
    var isDarkMode: Bool { get set }
    var darkColor: UIColor? { get set }
    var lightColor: UIColor? { get set }
    func getDarkView() throws -> Self
    func getLightView() throws -> Self
}

extension UIView {
    private static let lightColor = ObjectAssociation<UIColor>()
    private static let darkColor = ObjectAssociation<UIColor>()
    
    public var lightColor: UIColor? {
        get { return UIView.lightColor[self] }
        set { UIView.lightColor[self] = newValue }
    }
    
    public var darkColor: UIColor? {
        get { return UIView.darkColor[self] }
        set { UIView.darkColor[self] = newValue }
    }
    
    public func set(lightColor: UIColor, darkColor: UIColor) {
        
    }
}



extension UIView {
    
    public var isDarkMode: Bool {
        get {
            guard let value = objc_getAssociatedObject(self, &self.isDarkMode) as? Bool else {
                return false
            }
            return value
        }
        set (newValue) {
            objc_setAssociatedObject(self, &self.isDarkMode, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
//    public var darkColor: UIColor? {
//        get {
//            guard let value = objc_getAssociatedObject(self, &self.darkColor) as? UIColor else {
//                return nil
//            }
//            return value
//        }
//        set (newValue) {
//            objc_setAssociatedObject(self, &self.darkColor, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    
//    public var lightColor: UIColor? {
//        get {
//            guard let value = objc_getAssociatedObject(self, &self.lightColor) as? UIColor else {
//                return nil
//            }
//            return value
//        }
//        set (newValue) {
//            objc_setAssociatedObject(self, &self.lightColor, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    
    public func set(lightColor: UIColor, darkColor: UIColor, in darkMode: Bool = false) {
        self.isDarkMode = darkMode
        self.lightColor = lightColor
        self.darkColor = darkColor
    }
    
    public func enableDarkMode() {
        isDarkMode = true
        if darkColor != nil {
            backgroundColor = darkColor
        } else {
            backgroundColor = .black
        }
    }
    
    public func disableDarkMode() {
        isDarkMode = false
        if lightColor != nil {
            backgroundColor = lightColor
        } else {
            backgroundColor = .white
        }
    }
}

public final class ObjectAssociation<T: AnyObject> {
    
    private let policy: objc_AssociationPolicy
    
    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        
        self.policy = policy
    }
    
    /// Accesses associated object.
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: AnyObject) -> T? {
        
        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as! T? }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}

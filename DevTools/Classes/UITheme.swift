/*
 * UITheme
 *
 * Created by Erik Bean on 8/16/17
 * Copyright © 2018 Erik Bean
 */

import UIKit

/// UITheme Errors
public enum UIThemeError: Error {
    case wrongProfileType
    case unsupportedType
}

extension UIThemeError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .wrongProfileType:
            return NSLocalizedString("Profile does not match Theme Object, please check profile type!", comment: "")
        case .unsupportedType:
            return NSLocalizedString("This object is not supported.", comment: "")
        }
    }
}

public class UITheme {
    
    /// UITheme Manager
    public static let manager = UITheme()
    private init() {}
    
    /// UITheme Object Pool
    private var elementPool = [UIThemeElement]()
    
    //MARK: -Theme Options and Checks
    public weak var delegate: UIThemeDelegate?
    /// Check if dark mode is enabled
    public private(set) var isThemeOn = false
    /// Time at which everything animates
    public var animationTime: TimeInterval = 0.5
    
    //MARK: -Methods
    
    /// Check if the element pool contains an object
    public func poolContains(_ element: UIThemeElement) -> Bool {
        if elementPool.contains(element) {
            return true
        } else {
            return false
        }
    }
    
    /// Add an object to the element pool
    public func addToPool(_ element: UIThemeElement) {
        elementPool.append(element)
    }
    
    /// Add multiple objects to element pool
    public func addToPool(_ elements: [UIThemeElement]) {
        elementPool.append(contentsOf: elements)
    }
    
    /// Remove an object from the element pool
    public func removeFromPool(_ element: UIThemeElement) {
        elementPool.remove(at: elementPool.index(of: element)!)
    }
    
    /// Empty the element pool
    public func removeAllFromPool() {
        elementPool.removeAll()
    }
    
    /// Enable the theme for all objects in the element pool
    ///
    /// - note: This is automaticly animated. The object pool is animated as one instance, and not individualy.
    public func enableTheme(animated: Bool = true) throws {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animated {
            t = animationTime
        }
        UIView.animate(withDuration: t, animations: {
            UIView.animate(withDuration: t) {
                for element in self.elementPool {
                    try? element.enableTheme(animated: false)
                }
            }
        }) { (_) in
            self.isThemeOn = true
            self.delegate?.themeDidChange!()
        }
    }
    
    /// Disable the theme for all objects in the element pool
    ///
    /// - note: This is automaticly animated. The object pool is animated as one instance, and not individualy.
    public func disableTheme(animated: Bool = true) throws {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animated {
            t = animationTime
        }
        UIView.animate(withDuration: t, animations: {
            for element in self.elementPool {
                try? element.disableTheme(animated: false)
            }
        }) { (_) in
            self.isThemeOn = false
            self.delegate?.themeDidChange!()
        }
    }
}

@objc public protocol UIThemeDelegate: class {
    @objc optional func themeWillChange()
    
    // TODO: Subsitute above throws for didNotChange.
    //       Must include a backup call to disable/
    //       enable theme to revert changes.
    
    //    @objc optional func themeDidNotChange(error: Error)
    @objc optional func themeDidChange()
}

// TODO: Add preset themes
//public enum UIThemePreset {
//    case hombrew
//    case dark
//    case light
//}


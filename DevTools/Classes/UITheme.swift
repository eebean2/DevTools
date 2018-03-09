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
    /// Force theme change on failure
    ///
    /// - note: If false, the theme will automaticly revert back.
    public var forceFailedChange = true
    /// Animate force change on failure
    public var animateForceChange = false
    
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
    
    /// Check if all the elements in the object pool will change without error
    ///
    /// - note: IF this throws, you have AT LEAST one object that will not work. This means you may or may not have more. You may force it to still enable or disable the theme.
    func validatePool() -> (element: UIThemeElement?, error: Error?) {
        for element in elementPool {
            do {
                try element.validate()
            } catch let error {
                return (element, error)
            }
        }
        return (nil, nil)
    }
    
    /// Enable the theme for all objects in the element pool
    ///
    /// - note: This is automaticly animated. The pool is animated as one instance, and not individualy.
    public func enableTheme(animated: Bool = true) {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animated {
            t = animationTime
        }
        UIView.animate(withDuration: t) {
            for element in self.elementPool {
                do {
                    try element.enableTheme(animated: animated)
                } catch let error {
                    self.delegate?.themeDidNotChange(onElement: element, error: error)
                    if self.forceFailedChange {
                        self.forceEnableTheme()
                    } else {
                        self.forceDisableTheme()
                    }
                    return
                }
            }
            self.isThemeOn = true
            self.delegate?.themeDidChange!()
        }
    }
    
    /// Disable the theme for all objects in the element pool
    ///
    /// - note: This is automaticly animated. The object pool is animated as one instance, and not individualy.
    public func disableTheme(animated: Bool = true) {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animated {
            t = animationTime
        }
        UIView.animate(withDuration: t) {
            for element in self.elementPool {
                do {
                    try element.disableTheme(animated: animated)
                } catch let error {
                    self.delegate?.themeDidNotChange(onElement: element, error: error)
                    if self.forceFailedChange {
                        self.forceDisableTheme()
                    } else {
                        self.forceDisableTheme()
                    }
                    return
                }
            }
            self.isThemeOn = false
            self.delegate?.themeDidChange!()
        }
    }
    
    private func forceEnableTheme() {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animateForceChange {
            t = animationTime
        }
        UIView.animate(withDuration: t) {
            for element in self.elementPool {
                try? element.enableTheme(animated: false)
            }
        }
        self.isThemeOn = true
        self.delegate?.themeDidChange!()
    }
    
    private func forceDisableTheme() {
        self.delegate?.themeWillChange!()
        var t: TimeInterval = 0
        if animateForceChange {
            t = animationTime
        }
        UIView.animate(withDuration: t) {
            for element in self.elementPool {
                try? element.disableTheme(animated: false)
            }
        }
        self.isThemeOn = false
        self.delegate?.themeDidChange!()
    }
}

@objc public protocol UIThemeDelegate: class {
    @objc optional func themeWillChange()
    func themeDidNotChange(onElement: UIThemeElement?, error: Error)
    @objc optional func themeDidChange()
}

// TODO: Add preset themes
//public enum UIThemePreset {
//    case hombrew
//    case dark
//    case light
//}


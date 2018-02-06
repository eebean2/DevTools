//
//  UIThemeManager.swift
//  Pods
//
//  Created by Erik Bean on 8/16/17.
//
//
//  NOT FOR PUBLIC USE

import UIKit

public class UIThemeManager {
    
    public init() { }
    
    //MARK: -Theme Options and Checks
    /// UITheme Delegate
    public weak var delegate: UIThemeDelegate?
    /// Check if dark mode is enabled
    public private(set) var isDarkMode = false
    /// Update the status bar
    public var statusBarAutoUpdate = true
    /// The rate at which the screen changes
    public var lazyUpdate = true
    
    //MARK: -Pool
    
    private var elementPool = [UIThemeElement]()
    
    /// Change the status bar style
    public func setStatusBar(_ style: UIStatusBarStyle) {
        UIApplication.shared.statusBarStyle = style
    }
    
    /// Quickly set an element to presleectd theme colors
    public func set(object: NSObject, toTheme theme: UIThemePreselect) -> UIThemeElement {
        switch theme {
        case .homebrew:
            if object is UILabel {
                return UIThemeElement(object, lightColor: .black, darkColor: UIColor(red: 56/255, green: 254/244, blue: 40/255, alpha: 1))
            } else if object is UIView {
                return UIThemeElement(object, lightColor: .white, darkColor: .black)
            }
        case .dark:
            return UIThemeElement(object, lightColor: .white, darkColor: .black)
        case .light:
            return UIThemeElement(object, lightColor: .white, darkColor: .black)
        }
        return UIThemeElement(object, lightColor: .white, darkColor: .white)
    }
    
    public func enableDarkMode() {
        if lazyUpdate {
            UIView.animate(withDuration: 0.5, animations: {
                self.delegate?.themeWillChange!()
                for element in self.elementPool {
                    element.enableDarkMode()
                }
                if self.statusBarAutoUpdate {
                    UIApplication.shared.statusBarStyle = .lightContent
                }
                self.isDarkMode = true
            }) { (success) in
                if success {
                    self.delegate?.themeDidChange!()
                } else {
                    self.delegate?.themeDidNotChange!(error: NSError(domain: "UITMError", code: 000, userInfo: [NSLocalizedDescriptionKey: "Unknown Error."]))
                }
            }
        } else {
            for element in elementPool {
                element.enableDarkMode()
            }
            if statusBarAutoUpdate {
                UIApplication.shared.statusBarStyle = .lightContent
            }
            isDarkMode = true
            delegate?.themeDidChange!()
        }
    }
    
    public func disableThemes() {
        if lazyUpdate {
            UIView.animate(withDuration: 0.5, animations: {
                self.delegate?.themeWillChange!()
                for element in self.elementPool {
                    element.disableDarkMode()
                }
                if self.statusBarAutoUpdate {
                    UIApplication.shared.statusBarStyle = .default
                }
                self.isDarkMode = false
            }) { (success) in
                if success {
                    self.delegate?.themeDidChange!()
                } else {
                    self.delegate?.themeDidNotChange!(error: NSError(domain: "UITMError", code: 000, userInfo: [NSLocalizedDescriptionKey: "Unknown Error."]))
                }
            }
        } else {
            for element in elementPool {
                element.disableDarkMode()
            }
            if statusBarAutoUpdate {
                UIApplication.shared.statusBarStyle = .default
            }
            isDarkMode = false
            delegate?.themeDidChange!()
        }
    }
    
    public func add(_ element: UIThemeElement) {
        elementPool.append(element)
    }
}

public typealias Element = AnyObject

public class UIThemeElement {
    public let element: Element!
    public let lightColor: UIColor!
    public let darkColor: UIColor!
    public private(set) var isDarkMode: Bool!
    
    public init(_ element: Element, lightColor: UIColor, darkColor: UIColor, darkMode: Bool = false) {
        self.element = element
        self.lightColor = lightColor
        self.darkColor = darkColor
        self.isDarkMode = darkMode
    }
    
    /// Enables the dark version of the element, 
    /// if incompatible element, the element is ignored
    public func enableDarkMode() {
        if let label = element as? UILabel {
            label.textColor = darkColor
        } else if let view = element as? UIView {
            view.backgroundColor = darkColor
        } else {
            DevCore.log(":: UIThemeElement Error :: Unsupported element. Aborting dark mode request.")
        }
    }
    
    /// Enables the light version of the element,
    /// if incompatible element, the element is ignored
    public func disableDarkMode() {
        if let label = element as? UILabel {
            label.textColor = lightColor
        } else if let view = element as? UIView {
            view.backgroundColor = lightColor
        } else {
            DevCore.log(":: UIThemeElement Error :: Unsupported element. Aborting light mode request.")
        }
    }
}

@objc public protocol UIThemeDelegate: class {
    @objc optional func themeWillChange()
    @objc optional func themeDidNotChange(error: Error)
    @objc optional func themeDidChange()
}

public enum UIThemePreselect {
    case homebrew
    case dark
    case light
}

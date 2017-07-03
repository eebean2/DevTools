/*
 *  DevTools
 *
 *  Console.swift
 *
 *  Created by Erik Bean on 5.2.17
 *  Copyright © 2017 Erik Bean
 */

import UIKit
import AVKit
import GLKit
import SpriteKit
import SceneKit

internal typealias ConsoleCompletion = (Console) -> Void // Public in future versions
private typealias BasicCompletion = () -> Void

internal class Console: DevError {

    //MARK:- Basic Variables

    private let superview: UIView!
    private var console: UITextView!
    private var background: UIView!
    private var setupComplete = false
    
    //MARK:- Settings
    
    public let isReadOnly: Bool!
    public private(set) var isFullscreen = false

    public var backgroundColor: UIColor = .black
    public var textColor: UIColor = .green
    public var warningColor: UIColor = .yellow
    public var errorColor: UIColor = .red
    public var diagColor: UIColor = .cyan
    public var textFieldColor: UIColor = .white
    public var textFieldTextColor: UIColor = .white
    
    public var fullscreenEnabled = true

    //MARK:- Init
    
    /// -warning: Currently not setup, please use (on: ...) or (on: ..., readOnly: ...)
    @available(*, introduced: 2.0)
    required public init(_ view: UIView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.isReadOnly = readOnly
        self.superview = view
        super.init()
        self.setup() {
            Core.logDiag("Console is not finished, please do not use")
            completion(self)
        }
    }
    
    @available(*, unavailable)
    convenience public init(_ controller: UIViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ controller: UITableViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ controller: UICollectionViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ controller: UIPageViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ controller: AVPlayerViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ view: GLKView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        let v: UIView = view
        self.init(v, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ view: SKView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        let v: UIView = view
        self.init(v, readOnly: readOnly, completion: completion)
    }
    
    @available(*, unavailable)
    public convenience init(_ scene: SKScene, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        let v: UIView = scene.view!
        self.init(v, readOnly: readOnly, completion: completion)
    }

    public required init(on view: UIView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.isReadOnly = readOnly
        self.superview = view
        self.isFullscreen = true
        super.init()
        self.setup() {
            Core.logDiag("Required Init Fisned")
            completion(self)
        }
    }

    public convenience init(on controller: UIViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(on: controller.view, readOnly: readOnly, completion: completion)
    }

    //MARK:- Setup (private)

    private func setup(completion: BasicCompletion) {
        setupBackground() {
//            setupConsole() {
                setupComplete = true
            completion()
//            }
        }
    }

    private func setupBackground(completion: () -> Void) {
        if isFullscreen {
            background = UIView(frame: superview.frame)
            background.backgroundColor = .clear
            superview.addSubview(background)
            
            var frame = CGRect()
            if superview.frame.minY < Core().statusBarHeight {
                if !Core().isStatusBarHidden {
                    frame = CGRect(x: superview.frame.minX, y: Core().statusBarHeight + 8, width: superview.frame.width, height: superview.frame.height - (Core().statusBarHeight + 8))
                }
            } else {
                frame = superview.frame
            }
            
            console = UITextView(frame: frame)
            console.backgroundColor = .clear
            console.isEditable = false
            console.attributedText = NSAttributedString(string: "Welcome to Console\n", attributes: [NSForegroundColorAttributeName: textColor])
            background.addSubview(console)
            
            completion()
        } else {
            completion()
        }
    }

    private func setupConsole(completion: () -> Void) {
        if isReadOnly {
            console = UITextView(frame: superview.frame)
            console.backgroundColor = .clear
            completion()
        } else {
            completion()
        }
    }
    
    private func setupTextfield() {
        if isReadOnly {
            return
        }
    }

    //MARK:- Teardown (public)

    public func removeFromSuperview() {
        if !setupComplete {
            Core.logError(kDTNOSETUP)
            return
        }
        background.removeFromSuperview()
    }

    public func removeAndReset() {
        if !setupComplete {
            Core.logError(kDTNOSETUP)
            return
        }
        background.removeFromSuperview()
        reset()
    }

    private func reset() {
        console.removeFromSuperview()
        console = nil
        // Reset Console
    }

    //MARK:- Print

    public func print<Message>(_ message: Message, method: PrintMethod = .both) {
        if !setupComplete {
            Core.logConsoleError(kDTNOSETUP)
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: "\(message)\n", attributes: [NSForegroundColorAttributeName: textColor]))
            console.attributedText = i
            Core.log(message)
        case .xcodeOnly:
            Core.log(message)
        case .default:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: "\(message)\n", attributes: [NSForegroundColorAttributeName: textColor]))
            console.attributedText = i
        }
    }
    
    public func printDiag<Message>(_ diagnostic: Message, method: PrintMethod = .both) {
        if !setupComplete {
            Core.logConsoleError(kDTNOSETUP)
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: DIAGNOSTIC :: \(diagnostic)\n)", attributes: [NSForegroundColorAttributeName: diagColor]))
            console.attributedText = i
            Core.logDiag(diagnostic)
        case .xcodeOnly:
            Core.logDiag(diagnostic)
        case .default:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: DIAGNOSTIC :: \(diagnostic)\n", attributes: [NSForegroundColorAttributeName: diagColor]))
            console.attributedText = i
        }
    }
    
    public func printWarning<Message>(_ warning: Message, method: PrintMethod = .both) {
        if !setupComplete {
            Core.logConsoleError(kDTNOSETUP)
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: WARNING :: \(warning)\n)", attributes: [NSForegroundColorAttributeName: warningColor]))
            console.attributedText = i
            Core.logWarning(warning)
        case .xcodeOnly:
            Core.logWarning(warning)
        case .default:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: WARNING :: \(warning)\n", attributes: [NSForegroundColorAttributeName: warningColor]))
            console.attributedText = i
        }
    }

    //MARK:- Public Functions

    public func clear() {
        if !setupComplete {
            Core.logError(kDTNOSETUP)
            return
        }
        // Clear Console
    }
    
    public func printDiagnostic() {
        if setupComplete {
            Core.log("\nConsole Diagnostic:\n")
            Core.logDiag("Console Background: \(backgroundColor)")
            Core.logDiag("Console Text Color: \(textColor.description)")
            Core.logDiag("Console Warning Color: \(warningColor.description)")
            Core.logDiag("Console Error Color: \(errorColor.description)")
            Core.logDiag("Console Diagnostic Color: \(diagColor.description)")
            Core.logDiag("FullScreen Enabled: \(fullscreenEnabled)")
            Core.logDiag("Is Fullscreen: \(isFullscreen)")
            Core.logDiag("Is Read Only: \(isReadOnly!)\n")
            Core.logDiag("Console Text:\n")
            if console.text.isEmpty {
                Core.logDiag("Console has no text")
            } else {
                Core.logDiag(console.text!)
            }
        } else {
            Core.log("Console has not been setup yet")
        }
    }
}

public enum PrintMethod {
    case `default`, xcodeOnly, both
}



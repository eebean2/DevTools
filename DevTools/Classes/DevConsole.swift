/*
 * Console
 *
 * Created by Erik Bean on 5/2/17
 * Copyright © 2018 Erik Bean
 */

import UIKit
import AVKit
import GLKit
import SpriteKit
import SceneKit

public enum PrintMethod {
    case devOnly, xcodeOnly, both
}

public typealias ConsoleCompletion = (DevConsole) -> Void // Public in future versions
private typealias BasicCompletion = () -> Void

public class DevConsole {

    //MARK:- Basic Variables

    private let superview: UIView!
    private var console: UITextView!
    private var background: UIView!
    private var setupComplete = false
    
    //MARK:- Public Settings
    
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
        self.setup() {
            DevCore.logDiag("Console is not finished, please do not use")
            completion(self)
        }
    }
    
    convenience public init(_ controller: UIViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ controller: UITableViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ controller: UICollectionViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ controller: UIPageViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ controller: AVPlayerViewController, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.init(controller.view, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ view: GLKView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        let v: UIView = view
        self.init(v, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ view: SKView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        let v: UIView = view
        self.init(v, readOnly: readOnly, completion: completion)
    }
    
    public convenience init(_ scene: SKScene, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        let v: UIView = scene.view!
        self.init(v, readOnly: readOnly, completion: completion)
    }

    public required init(on view: UIView, readOnly: Bool = false, completion: @escaping ConsoleCompletion) {
        self.isReadOnly = readOnly
        self.superview = view
        self.isFullscreen = true
        self.setup() {
            DevCore.logDiag("Required Init Fisned")
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

    private func setupBackground(completion: BasicCompletion) {
        if isFullscreen {
            background = UIView(frame: superview.frame)
            background.backgroundColor = .clear
            superview.addSubview(background)
            
            var frame = CGRect()
            if superview.frame.minY < DevCore().statusBarHeight {
                if !DevCore().isStatusBarHidden {
                    frame = CGRect(x: superview.frame.minX, y: DevCore().statusBarHeight + 8, width: superview.frame.width, height: superview.frame.height - (DevCore().statusBarHeight + 8))
                }
            } else {
                frame = superview.frame
            }
            
            console = UITextView(frame: frame)
            console.backgroundColor = .clear
            console.isEditable = false
            console.attributedText = NSAttributedString(string: "Welcome to Console\n", attributes: [NSAttributedStringKey.foregroundColor: textColor])
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
            DevCore.logError("You must complete setup first")
            return
        }
        background.removeFromSuperview()
    }

    public func removeAndReset() {
        if !setupComplete {
            DevCore.logError("You must complete setup first")
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
            DevCore.logConsoleError("You must complete setup first")
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: "\(message)\n", attributes: [NSAttributedStringKey.foregroundColor: diagColor]))
            console.attributedText = i
            DevCore.log(message)
        case .xcodeOnly:
            DevCore.log(message)
        case .devOnly:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: "\(message)\n", attributes: [NSAttributedStringKey.foregroundColor: diagColor]))
            console.attributedText = i
        }
    }
    
    public func printDiag<Message>(_ diagnostic: Message, method: PrintMethod = .both) {
        if !setupComplete {
            DevCore.logConsoleError("You must complete setup first")
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: DIAGNOSTIC :: \(diagnostic)\n)", attributes: [NSAttributedStringKey.foregroundColor: diagColor]))
            console.attributedText = i
            DevCore.logDiag(diagnostic)
        case .xcodeOnly:
            DevCore.logDiag(diagnostic)
        case .devOnly:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: DIAGNOSTIC :: \(diagnostic)\n)", attributes: [NSAttributedStringKey.foregroundColor: diagColor]))
            console.attributedText = i
        }
    }
    
    public func printWarning<Message>(_ warning: Message, method: PrintMethod = .both) {
        if !setupComplete {
            DevCore.logConsoleError("You must complete setup first")
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: WARNING :: \(warning)\n)", attributes: [NSAttributedStringKey.foregroundColor: warningColor]))
            console.attributedText = i
            DevCore.logWarning(warning)
        case .xcodeOnly:
            DevCore.logWarning(warning)
        case .devOnly:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: WARNING :: \(warning)\n)", attributes: [NSAttributedStringKey.foregroundColor: warningColor]))
            console.attributedText = i
        }
    }
    
    public func printError<Message>(_ error: Message, method: PrintMethod = .both) {
        if !setupComplete {
            DevCore.logConsoleError("You must complete setup first")
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: ERROR :: \(error)\n)", attributes: [NSAttributedStringKey.foregroundColor: errorColor]))
            console.attributedText = i
            DevCore.logError(error)
        case .xcodeOnly:
            DevCore.logError(error)
        case .devOnly:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: ":: ERROR :: \(error)\n)", attributes: [NSAttributedStringKey.foregroundColor: errorColor]))
            console.attributedText = i
        }
    }

    //MARK:- Public Functions

    public func clear() {
        if !setupComplete {
            DevCore.logError("You must complete setup first")
            return
        }
        // Clear Console
    }
    
    public func printDiagnostic() {
        if setupComplete {
            DevCore.log("\nConsole Diagnostic:\n")
            DevCore.logDiag("Console Background: \(backgroundColor)")
            DevCore.logDiag("Console Text Color: \(textColor.description)")
            DevCore.logDiag("Console Warning Color: \(warningColor.description)")
            DevCore.logDiag("Console Error Color: \(errorColor.description)")
            DevCore.logDiag("Console Diagnostic Color: \(diagColor.description)")
            DevCore.logDiag("FullScreen Enabled: \(fullscreenEnabled)")
            DevCore.logDiag("Is Fullscreen: \(isFullscreen)")
            DevCore.logDiag("Is Read Only: \(isReadOnly!)\n")
            DevCore.logDiag("Console Text:\n")
            if console.text.isEmpty {
                DevCore.logDiag("Console has no text")
            } else {
                DevCore.logDiag(console.text!)
            }
        } else {
            DevCore.log("Console has not been setup yet")
        }
    }
}



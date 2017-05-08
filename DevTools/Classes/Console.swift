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

@available(*, unavailable)
public class Console: DevError {

    //MARK:- Basic Variables

    fileprivate let superview: UIView!
    private var console: UITextView!
    private var background: UIView!
    private var setupComplete = false
    
    //MARK:- Settings
    
    public let isReadOnly: Bool!
    private(set) var isFullscreen = false

    public var backgroundColor: UIColor = .black
    public var textColor: UIColor = .green
    public var warningColor: UIColor = .yellow
    public var errorColor: UIColor = .red
    public var diagColor: UIColor = .cyan
    public var textFieldColor: UIColor = .white
    public var textFieldTextColor: UIColor = .white
    
    public var fullscreenEnabled = true

    //MARK:- Init

    required public init(_ view: UIView, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = view
        super.init()
        self.setup()
    }

    public init(_ controller: UIViewController, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = controller.view
        super.init()
        setup()
    }

    public init(_ controller: UITableViewController, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = controller.view
        super.init()
        setup()
    }

    public init(_ controller: UICollectionViewController, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = controller.view
        super.init()
        setup()
    }

    public init(_ controller: UIPageViewController, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = controller.view
        super.init()
        setup()
    }

    public init(_ controller: AVPlayerViewController, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = controller.view
        super.init()
        setup()
    }

    public init(_ view: GLKView, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = view
        super.init()
        setup()
    }

    public init(_ view: SKView, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = view
        super.init()
        setup()
    }

    public init(_ scene: SKScene, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = scene.view
        super.init()
        setup()
    }

    public init(on view: UIView, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = view
        self.isFullscreen = true
        super.init()
        setup()
    }

    public init(on controller: UIViewController, readOnly: Bool = false) {
        self.isReadOnly = readOnly
        self.superview = controller.view
        self.isFullscreen = true
        super.init()
        setup()
    }

    //MARK:- Setup (private)

    private func setup() {
        setupBackground()
        setupConsole()
        // Do any needed additional setup here

        setupComplete = true
    }

    private func setupBackground() {
//        var x: CGFloat = 0
//        var y: CGFloat = 0
//        var height: CGFloat = 0
//        var width: CGFloat = 0
    }

    private func setupConsole() {
        
    }
    
    private func setupTextfield() {
        if isReadOnly {
            return
        }
    }

    //MARK:- Teardown

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

    public func print<message>(_ message: message, method: PrintMethod = .both) {
        if !setupComplete {
            Core.logError(kDTNOSETUP)
            return
        }
        switch method {
        case .both:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: "\(message)\n", attributes: [NSForegroundColorAttributeName: textColor]))
            console.attributedText = i
            Core.log(method)
        case .xcodeOnly:
            Core.log(method)
        case .default:
            let i = NSMutableAttributedString(attributedString: console.attributedText)
            i.append(NSAttributedString(string: "\(message)\n", attributes: [NSForegroundColorAttributeName: textColor]))
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
}

public enum PrintMethod {
    case `default`, xcodeOnly, both
}




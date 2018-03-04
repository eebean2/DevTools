/*
 * Toast
 *
 * Created by Erik Bean on 5/3/17
 * Copyright © 2018 Erik Bean
 */

import UIKit

/// A version of Toast, coming soon with more custimizations!
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(OSX, unavailable)
public class Toast: UIView {
    
    /// If you see this... your snooping... and changing this would make bad things happen...
    private var last = CGPoint.zero
    /// The title of the primary label
    public var primaryTitle = UILabel()
    /// The changeable text of the primary label
    public var primary = UILabel()
    /// The title of the secondary label
    public var secondaryTitle = UILabel()
    /// The changeable text of the secondary label
    public var secondary = UILabel()
    /// Enable to restrict Toast to one place
    public var disableDragging = false
    private var primaryWidth: NSLayoutConstraint!
    private var secondaryWidth: NSLayoutConstraint!

    /// Please do not override me... master has alrady overridden me... if you wish to custimize me, please submit custimization request via issues on github!
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 20, y: 30, width: 250, height: 175)
        backgroundColor = UIColor(white: 0, alpha: 0.25)
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))
        addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(zoomShrink)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc(detectPanWithSender:)
    private func detectPan(_ sender: UIPanGestureRecognizer) {
        if !disableDragging {
            let i = sender.translation(in: superview)
            center = CGPoint(x: last.x + i.x, y: last.y + i.y)
        }
    }
    
    @objc(zoomShrinkWithSender:)
    private func zoomShrink(_ sender: UIPinchGestureRecognizer) {
        print("Scale: \(sender.scale)")
        print("Velosity: \(sender.velocity)")
    }
    
    private func getRect() -> CGRect {
        let x: CGFloat = 20
        let y: CGFloat = 30
        let width: CGFloat = 250
        var height: CGFloat = 0
        if primary.text != nil {
            height += primary.frame.height + 32
        }
        if secondary.text != nil {
            height += secondary.frame.height + 8
        }
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func labelOne() -> Bool {
        primaryTitle.frame = CGRect(x: 16, y: 16, width: 42, height: 21)
        primary.frame = CGRect(x: 66, y: 16, width: frame.width - (40 + primaryTitle.frame.width), height: 21)
        if primary.text != nil || primaryTitle.text != nil {
            if primaryTitle.text == "" || primaryTitle.text == nil {
                primaryTitle.text = "TEST 1:"
            }
            if primary.text == "" || primary.text == nil {
                primary.text = "sample text"
            }
            primaryTitle.sizeToFit()
            primary.numberOfLines = 0
            primary.lineBreakMode = .byWordWrapping
            addSubview(primaryTitle)
            addSubview(primary)
            NSLayoutConstraint(item: primaryTitle, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16).isActive = true
            NSLayoutConstraint(item: primaryTitle, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16).isActive = true
            NSLayoutConstraint(item: primary, attribute: .leading, relatedBy: .equal, toItem: primaryTitle, attribute: .trailing, multiplier: 1, constant: 8).isActive = true
            NSLayoutConstraint(item: primary, attribute: .top, relatedBy: .equal, toItem: primaryTitle, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: primary, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16).isActive = true
            primaryWidth = NSLayoutConstraint(item: primary, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: primary.frame.width)
            primaryWidth.isActive = true
            primaryTitle.translatesAutoresizingMaskIntoConstraints = false
            primary.translatesAutoresizingMaskIntoConstraints = false
            primary.sizeToFit()
            return true
        } else {
            return false
        }
    }
    
    private func labelTwo() -> Bool {
        secondaryTitle.frame = CGRect(x: 16, y: 45, width: 42, height: 21)
        secondary.frame = CGRect(x: 66, y: 45, width: frame.width - (40 + secondaryTitle.frame.width), height: 21)
        if secondary.text != nil || secondaryTitle.text != nil {
            if secondaryTitle.text == "" || secondaryTitle.text == nil {
                secondaryTitle.text = "TEST 2:"
            }
            if secondary.text == "" || secondary.text == nil {
                secondary.text = "sample text"
            }
            secondaryTitle.sizeToFit()
            secondary.numberOfLines = 0
            secondary.lineBreakMode = .byWordWrapping
            addSubview(secondaryTitle)
            addSubview(secondary)
            NSLayoutConstraint(item: secondary, attribute: .top, relatedBy: .equal, toItem: primary, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
            NSLayoutConstraint(item: secondary, attribute: .leading, relatedBy: .equal, toItem: secondaryTitle, attribute: .trailing, multiplier: 1, constant: 8).isActive = true
            NSLayoutConstraint(item: secondary, attribute: .top, relatedBy: .equal, toItem: secondaryTitle, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: secondaryTitle, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16).isActive = true
            secondaryTitle.translatesAutoresizingMaskIntoConstraints = false
            secondary.translatesAutoresizingMaskIntoConstraints = false
            secondary.sizeToFit()
            return true
        } else {
            return false
        }
    }
    
    /// Please do not override me... master has alrady overridden me... if you wish to custimize me, please submit custimization request via issues on github!
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !disableDragging {
            superview?.bringSubview(toFront: self)
            last = center
        }
    }
    
    /// Add to your chosen view, recommended your top most view to not accidently hide Toast
    @objc(addToView:)
    public func addTo(_ view: UIView) {
        let lo = labelOne()
        let lt = labelTwo()
        if !lo && !lt {
            primaryTitle.text = "nil:"
            primary.text = "nil"
            _ = labelOne()
        }
        frame = getRect()
        view.addSubview(self)
        view.bringSubview(toFront: self)
    }
    
    /// Add to your chosen controller, recommended your top most controller to not accidently hide Toast
    @objc(addToController:)
    public func addTo(_ controller: UIViewController) {
        addTo(controller.view)
    }
    
    /// Remove Toast from the superview
    public func remove() {
        removeFromSuperview()
    }
    
    /// Reset me to my original location
    public func resetLocation() {
        UIView.animate(withDuration: 0.5) {
            self.frame = self.getRect()
        }
    }
    
    /// Update Primary message label
    public func updatePrimary(_ message: String) {
        primary.text = message
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = self.getRect()
        }, completion: { (success) in
            if success {
                self.primary.sizeToFit()
            }
        })
    }
    
    /// Update Secondary message label
    public func updateSecondary(_ message: String) {
        secondary.text = message
        UIView.animate(withDuration: 0.5) {
            self.frame = self.getRect()
            self.secondary.sizeToFit()
        }
    }
    
    private var isDarkMode: Bool = false
    
    public func setDarkMode() throws {
        print("Setting Dark Mode")
        print(self.isDarkMode)
        if !self.isDarkMode {
            print("Setting Background")
            self.isDarkMode = true
            self.backgroundColor = .white
        } else {
            throw NSError(domain: "DevTools", code: 001, userInfo: [NSLocalizedDescriptionKey: "Already in Dark Mode"])
        }
    }
    
    public func setLightMode() throws {
        print("Setting Light Mode")
        print(self.isDarkMode)
        if self.isDarkMode {
            print("Setting Background")
            self.isDarkMode = false
            self.backgroundColor = UIColor(white: 0, alpha: 0.25)
        } else {
            throw NSError(domain: "DevTools", code: 001, userInfo: [NSLocalizedDescriptionKey: "Already in Light Mode"])
        }
    }
    
    
}

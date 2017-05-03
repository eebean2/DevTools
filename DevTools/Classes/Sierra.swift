//
//  Sierra.swift
//  DTCore
//
//  Created by Erik Bean on 5/3/17.
//  Copyright © 2017 Erik Bean. All rights reserved.
//

import UIKit

public class Sierra: UIView {

    private var last = CGPoint.zero
    public var primaryTitle = UILabel()
    public var primary = UILabel()
    public var secondaryTitle = UILabel()
    public var secondary = UILabel()
    public var disableDragging = false
    private var primaryWidth: NSLayoutConstraint!
    private var secondaryWidth: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 20, y: 30, width: 250, height: 175)
        backgroundColor = UIColor(white: 0, alpha: 0.25)
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(detectPan)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func detectPan(_ sender: UIPanGestureRecognizer) {
        if !disableDragging {
            let i = sender.translation(in: superview)
            center = CGPoint(x: last.x + i.x, y: last.y + i.y)
        }
    }
    
    private func getRect() -> CGRect {
        let x: CGFloat = 20
        let y: CGFloat = 30
        let width: CGFloat = 250
        var height: CGFloat = 0
        if primary.text != "" || primary.text != nil {
            height += primary.frame.height + 32
        }
        if secondary.text != "" || secondary.text != nil {
            height += secondary.frame.height + 8
        }
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func labelOne() -> Bool {
        primaryTitle.frame = CGRect(x: 16, y: 16, width: 42, height: 21)
        primary.frame = CGRect(x: 66, y: 16, width: frame.width - (40 + primaryTitle.frame.width), height: 21)
        if primary.text != "" || primaryTitle.text != "" {
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
        if secondary.text != "" || secondaryTitle.text != "" {
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
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !disableDragging {
            superview?.bringSubview(toFront: self)
            last = center
        }
    }
    
    public func addTo(view: UIView) {
        let lo = labelOne()
        let lt = labelTwo()
        if !lo || !lt {
            primaryTitle.text = "nil:"
            primary.text = "nil"
            _ = labelOne()
        }
        frame = getRect()
        view.addSubview(self)
    }
    
    public func addTo(controller: UIViewController) {
        addTo(view: controller.view)
    }
    
    public func remove() {
        removeFromSuperview()
    }
    
    public func resetLocation() {
        UIView.animate(withDuration: 0.5) {
            self.frame = self.getRect()
        }
    }
    
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
    
    public func updateSecondary(_ message: String) {
        secondary.text = message
        UIView.animate(withDuration: 0.5) {
            self.frame = self.getRect()
            self.secondary.sizeToFit()
        }
    }
}

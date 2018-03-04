//
//  UIView.swift
//  UITheme
//
//  Created by Erik Bean on 2/7/18.
//  Copyright © 2018 Brick Water Studios. All rights reserved.
//

import UIKit

// MARK: -View
extension UIView {
    @objc public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        if profile.elementType != .view {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.statusBar {
                    if UIApplication.shared.statusBarStyle == .lightContent {
                        UIApplication.shared.statusBarStyle = .default
                    } else {
                        UIApplication.shared.statusBarStyle = .lightContent
                    }
                }
            }
        }
    }
    
    @objc public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        if profile.elementType != .view {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                if profile.statusBar {
                    if UIApplication.shared.statusBarStyle == .lightContent {
                        UIApplication.shared.statusBarStyle = .default
                    } else {
                        UIApplication.shared.statusBarStyle = .lightContent
                    }
                }
            }
        }
    }
}

// MARK: -TableView
extension UITableView {
    public func enableTheme(profile: UIThemeProfile.label, animated: Bool = true) throws {
        if profile.elementType != .label {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.label, animated: Bool = true) throws {
        if profile.elementType != .label {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Label
extension UILabel {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.label, animated: Bool = true) throws {
        if profile.elementType != .label {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeText != nil {
                    self.text = profile.themeText
                }
                if profile.themeTextColor != nil {
                    print("Text Color: \(profile.themeTextColor.debugDescription)")
                    self.textColor = profile.themeTextColor
                }
                self.shadowColor = profile.themeShadow
                self.highlightedTextColor = profile.themeHighlight
                if profile.themeAttributedText != nil {
                    self.attributedText = profile.themeAttributedText
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.label, animated: Bool = true) throws {
        if profile.elementType != .label {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                if profile.defaultTextColor != nil {
                    self.textColor = profile.defaultTextColor
                }
                if profile.defaultText != nil {
                    self.text = profile.defaultText
                }
                self.shadowColor = profile.defaultShadow
                self.highlightedTextColor = profile.defaultHighlight
                if profile.defaultAttributedText != nil {
                    self.attributedText = profile.defaultAttributedText
                }
            }
        }
    }
}

// MARK: -Button
extension UIButton {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.button, animated: Bool = true) throws {
        if profile.elementType != .button {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeTitle != nil {
                    for state in profile.themeTitle! {
                        self.setTitle(state.key, for: state.value)
                    }
                }
                if profile.themeImage != nil {
                    for state in profile.themeImage! {
                        self.setImage(state.key, for: state.value)
                    }
                }
                if profile.themeTitleColor != nil {
                    for state in profile.themeTitleColor! {
                        self.setTitleColor(state.key, for: state.value)
                    }
                }
                if profile.themeAttributedTitle != nil {
                    for state in profile.themeAttributedTitle! {
                        self.setAttributedTitle(state.key, for: state.value)
                    }
                }
                if profile.themeBackgroundImage != nil {
                    for state in profile.themeBackgroundImage! {
                        self.setBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.themeTitleShadowColor != nil {
                    for state in profile.themeTitleShadowColor! {
                        self.setTitleShadowColor(state.key, for: state.value)
                    }
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.button, animated: Bool = true) throws {
        if profile.elementType != .button {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                if profile.defaultTitle != nil {
                    for state in profile.defaultTitle! {
                        self.setTitle(state.key, for: state.value)
                    }
                }
                if profile.defaultImage != nil {
                    for state in profile.defaultImage! {
                        self.setImage(state.key, for: state.value)
                    }
                }
                if profile.defaultTitleColor != nil {
                    for state in profile.defaultTitleColor! {
                        self.setTitleColor(state.key, for: state.value)
                    }
                }
                if profile.defaultAttributedTitle != nil {
                    for state in profile.defaultAttributedTitle! {
                        self.setAttributedTitle(state.key, for: state.value)
                    }
                }
                if profile.defaultBackgroundImage != nil {
                    for state in profile.defaultBackgroundImage! {
                        self.setBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.defaultTitleShadowColor != nil {
                    for state in profile.defaultTitleShadowColor! {
                        self.setTitleShadowColor(state.key, for: state.value)
                    }
                }
            }
        }
    }
}

// MARK: -TextField
extension UITextField {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.textfield, animated: Bool = true) throws {
        if profile.elementType != .textfield {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.textColor = profile.themeTextColor
                self.attributedText = profile.themeAttributedText
                self.background = profile.themeBackgroundImage
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.textfield, animated: Bool = true) throws {
        if profile.elementType != .textfield {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.textColor = profile.defaultTextColor
                self.attributedText = profile.defaultAttributedText
                self.background = profile.defaultBackgroundImage
            }
        }
    }
}

// MARK: -Slider
extension UISlider {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.slider, animated: Bool = true) throws {
        if profile.elementType != .slider {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeThumbImage != nil {
                    for state in profile.themeThumbImage! {
                        self.setThumbImage(state.key, for: state.value)
                    }
                }
                if profile.themeMinTrackImage != nil {
                    for state in profile.themeMinTrackImage! {
                        self.setMinimumTrackImage(state.key, for: state.value)
                    }
                }
                if profile.themeMaxTrackImage != nil {
                    for state in profile.themeMaxTrackImage! {
                        self.setMaximumTrackImage(state.key, for: state.value)
                    }
                }
                self.minimumTrackTintColor = profile.themeMinTrackColor
                self.maximumTrackTintColor = profile.themeMaxTrackColor
                self.thumbTintColor = profile.themeThumbTint
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.slider, animated: Bool = true) throws {
        if profile.elementType != .slider {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                if profile.defaultThumbImage != nil {
                    for state in profile.defaultThumbImage! {
                        self.setThumbImage(state.key, for: state.value)
                    }
                }
                if profile.defaultMinTrackImage != nil {
                    for state in profile.defaultMinTrackImage! {
                        self.setMinimumTrackImage(state.key, for: state.value)
                    }
                }
                if profile.defaultMaxTrackImage != nil {
                    for state in profile.defaultMaxTrackImage! {
                        self.setMaximumTrackImage(state.key, for: state.value)
                    }
                }
                self.minimumTrackTintColor = profile.defaultMinTrackColor
                self.maximumTrackTintColor = profile.defaultMaxTrackColor
                self.thumbTintColor = profile.defaultThumbTint
            }
        }
    }
}

// MARK: -Switch

extension UISwitch {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.`switch`, animated: Bool = true) throws {
        if profile.elementType != .switch {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.onTintColor = profile.themeOnTint
                self.onImage = profile.themeOnImage
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.`switch`, animated: Bool = true) throws {
        if profile.elementType != .switch {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.onTintColor = profile.defaultOnTint
                self.onImage = profile.defaultOnImage
            }
        }
    }
}

// MARK: -Activity Indicator View
extension UIActivityIndicatorView {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.activityindicator, animated: Bool = true) throws {
        if profile.elementType != .activityindicator {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeStyle != nil {
                    self.activityIndicatorViewStyle = profile.themeStyle!
                }
                self.color = profile.themeColor
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.activityindicator, animated: Bool = true) throws {
        if profile.elementType != .activityindicator {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                if profile.defaultStyle != nil {
                    self.activityIndicatorViewStyle = profile.defaultStyle!
                }
                self.color = profile.defaultColor
            }
        }
    }
}

// MARK: -Progress View
extension UIProgressView {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.progressbar, animated: Bool = true) throws {
        if profile.elementType != .progressbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.progressTintColor = profile.themeProgressTint
                self.progressImage = profile.themeProgressImage
                self.trackTintColor = profile.themeTrackTint
                self.trackImage = profile.themeTrackImage
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.progressbar, animated: Bool = true) throws {
        if profile.elementType != .progressbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.progressTintColor = profile.defaultProgressTint
                self.progressImage = profile.defaultProgressImage
                self.trackTintColor = profile.defaultTrackTink
                self.trackImage = profile.defaultTrackImage
            }
        }
    }
}

// MARK: -Page Control
extension UIPageControl {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.pagecontrol, animated: Bool = true) throws {
        if profile.elementType != .pagecontrol {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.currentPageIndicatorTintColor = profile.themeCurrentPageColor
                self.pageIndicatorTintColor = profile.themePagesColor
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.pagecontrol, animated: Bool = true) throws {
        if profile.elementType != .pagecontrol {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.currentPageIndicatorTintColor = profile.defaultCurrentPageColor
                self.pageIndicatorTintColor = profile.defaultPagesColor
            }
        }
    }
}

// MARK: -Segmented Control
extension UISegmentedControl {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.segmentedcontroller, animated: Bool = true) throws {
        if profile.elementType != .segmentedcontroller {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.segmentedcontroller, animated: Bool = true) throws {
        if profile.elementType != .segmentedcontroller {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Stepper
extension UIStepper {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.stepper, animated: Bool = true) throws {
        if profile.elementType != .stepper {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.stepper, animated: Bool = true) throws {
        if profile.elementType != .stepper {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Table View Cell
extension UITableViewCell {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.tableviewcell, animated: Bool = true) throws {
        if profile.elementType != .tableviewcell {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.tableviewcell, animated: Bool = true) throws {
        if profile.elementType != .tableviewcell {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Image View
extension UIImageView {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.imageview, animated: Bool = true) throws {
        if profile.elementType != .imageview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.image = profile.themeImage
                self.highlightedImage = profile.themeHighlight
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.imageview, animated: Bool = true) throws {
        if profile.elementType != .imageview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.image = profile.defaultImage
                self.highlightedImage = profile.defaultHighlight
            }
        }
    }
}

// MARK: -Collection View
extension UICollectionView {
    public func enableTheme(profile: UIThemeProfile.collectionview, animated: Bool = true) throws {
        if profile.elementType != .collectionview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.collectionview, animated: Bool = true) throws {
        if profile.elementType != .collectionview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Collection View Cell
extension UICollectionViewCell {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.collectionviewcell, animated: Bool = true) throws {
        if profile.elementType != .collectionviewcell {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.collectionviewcell, animated: Bool = true) throws {
        if profile.elementType != .collectionviewcell {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Text View
extension UITextView {
    public func enableTheme(profile: UIThemeProfile.textview, animated: Bool = true) throws {
        if profile.elementType != .textview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.textColor = profile.themeTextColor
                self.attributedText = profile.themeAttributedText
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.textview, animated: Bool = true) throws {
        if profile.elementType != .textview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.textColor = profile.defaultTextColor
                self.attributedText = profile.defaultAttributedText
            }
        }
    }
}

// MARK: -Scroll View
extension UIScrollView {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.scrollview, animated: Bool = true) throws {
        if profile.elementType != .scrollview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.scrollview, animated: Bool = true) throws {
        if profile.elementType != .scrollview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Date Picker
extension UIDatePicker {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.datepicker, animated: Bool = true) throws {
        if profile.elementType != .datepicker {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.datepicker, animated: Bool = true) throws {
        if profile.elementType != .datepicker {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Picker View
extension UIPickerView {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.pickerview, animated: Bool = true) throws {
        if profile.elementType != .pickerview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.pickerview, animated: Bool = true) throws {
        if profile.elementType != .pickerview {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
            }
        }
    }
}

// MARK: -Navigation Bar
extension UINavigationBar {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.navigationbar, animated: Bool = true) throws {
        if profile.elementType != .navigationbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeBackgroundImage != nil {
                    for state in profile.themeBackgroundImage! {
                        self.setBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.themeBackgroundImageWithPosition != nil {
                    let background = profile.themeBackgroundImageWithPosition!
                    self.setBackgroundImage(background.image, for: background.position, barMetrics: background.metrics)
                }
                if profile.themeBarStyle != nil {
                    self.barStyle = profile.themeBarStyle!
                }
                self.setItems(profile.themeItems, animated: true)
                self.isTranslucent = profile.themeIsTranslucent
                self.barTintColor = profile.themeBarTint
                self.shadowImage = profile.themeShadowImage
                self.backIndicatorImage = profile.themeBackImage
                self.titleTextAttributes = profile.themeTitleTextAttributes
                if #available(iOS 11.0, *) {
                    self.largeTitleTextAttributes = profile.themeLargeTitleTextAttributes
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.navigationbar, animated: Bool = true) throws {
        if profile.elementType != .navigationbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                if profile.defaultBackgroundImage != nil {
                    for state in profile.defaultBackgroundImage! {
                        self.setBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.defaultBackgroundImageWithPosition != nil {
                    let background = profile.defaultBackgroundImageWithPosition!
                    self.setBackgroundImage(background.image, for: background.position, barMetrics: background.metrics)
                }
                if profile.defaultBarStyle != nil {
                    self.barStyle = profile.defaultBarStyle!
                }
                self.setItems(profile.defaultItems, animated: true)
                self.isTranslucent = profile.defaultIsTranslucent
                self.barTintColor = profile.defaultBarTint
                self.shadowImage = profile.defaultShadowImage
                self.backIndicatorImage = profile.defaultBackImage
                self.titleTextAttributes = profile.defaultTitleTextAttributes
                if #available(iOS 11.0, *) {
                    self.largeTitleTextAttributes = profile.defaultLargeTitleTextAttributes
                }
            }
        }
    }
}

// MARK: -Toolbar
extension UIToolbar {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.toolbar, animated: Bool = true) throws {
        if profile.elementType != .toolbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.barStyle = profile.themeBarStyle
                self.isTranslucent = profile.themeIsTranslucent
                self.barTintColor = profile.themeBarTint
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.toolbar, animated: Bool = true) throws {
        if profile.elementType != .toolbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.barStyle = profile.defaultBarStyle
                self.isTranslucent = profile.defaultIsTranslucent
                self.barTintColor = profile.defaultBarTint
            }
        }
    }
}

// MARK: -Bar Button Item
extension UIBarButtonItem {
    public func enableTheme(profile: UIThemeProfile.barbuttonitem, animated: Bool = true) throws {
        if profile.elementType != .barbuttonitem {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                if profile.themeBackgroundImage != nil {
                    for state in profile.themeBackgroundImage! {
                        self.setBackgroundImage(state.image, for: state.controlState, barMetrics: state.metrics)
                    }
                }
                if profile.themeBackgroundImageWithStyle != nil {
                    for state in profile.themeBackgroundImageWithStyle! {
                        self.setBackgroundImage(state.image, for: state.controlState, style: state.style, barMetrics: state.metrics)
                    }
                }
                if profile.themeBackButtonBackgroundImage != nil {
                    for state in profile.themeBackButtonBackgroundImage! {
                        self.setBackButtonBackgroundImage(state.image, for: state.controlState, barMetrics: state.metrics)
                    }
                }
                if profile.themeTitleTextAttributes != nil {
                    for state in profile.themeTitleTextAttributes! {
                        self.setTitleTextAttributes(state.attributes, for: state.controlState)
                    }
                }
                if profile.themeBarStyle != nil {
                    self.style = profile.themeBarStyle!
                }
                self.tintColor = profile.themeTint
                self.image = profile.themeImage
                self.landscapeImagePhone = profile.themeLandscapeImage
                if #available(iOS 11.0, *) {
                    self.largeContentSizeImage = profile.themeLargeContentImage
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.barbuttonitem, animated: Bool = true) throws {
        if profile.elementType != .barbuttonitem {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                if profile.defaultBackgroundImage != nil {
                    for state in profile.defaultBackgroundImage! {
                        self.setBackgroundImage(state.image, for: state.controlState, barMetrics: state.metrics)
                    }
                }
                if profile.defaultBackgroundImageWithStyle != nil {
                    for state in profile.defaultBackgroundImageWithStyle! {
                        self.setBackgroundImage(state.image, for: state.controlState, style: state.style, barMetrics: state.metrics)
                    }
                }
                if profile.defaultBackButtonBackgroundImage != nil {
                    for state in profile.defaultBackButtonBackgroundImage! {
                        self.setBackButtonBackgroundImage(state.image, for: state.controlState, barMetrics: state.metrics)
                    }
                }
                if profile.defaultTitleTextAttributes != nil {
                    for state in profile.defaultTitleTextAttributes! {
                        self.setTitleTextAttributes(state.attributes, for: state.controlState)
                    }
                }
                if profile.defaultBarStyle != nil {
                    self.style = profile.defaultBarStyle!
                }
                self.tintColor = profile.defaultTint
                self.image = profile.defaultImage
                self.landscapeImagePhone = profile.defaultLandscapeImage
                if #available(iOS 11.0, *) {
                    self.largeContentSizeImage = profile.defaultLargeContentImage
                }
            }
        }
    }
}

// MARK: -Tab Bar
extension UITabBar {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.tabbar, animated: Bool = true) throws {
        if profile.elementType != .tabbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                self.barStyle = profile.themeBarStyle
                self.isTranslucent = profile.themeIsTranslucent
                self.barTintColor = profile.themeBarTint
                self.backgroundImage = profile.themeBackgroundImage
                self.shadowImage = profile.themeShadowImage
                self.selectionIndicatorImage = profile.themeSelectionImage
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.tabbar, animated: Bool = true) throws {
        if profile.elementType != .tabbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.defaultBackground
                if profile.defaultTint != nil {
                    self.tintColor = profile.defaultTint
                }
                self.barStyle = profile.defaultBarStyle
                self.isTranslucent = profile.defaultIsTranslucent
                self.barTintColor = profile.defaultBarTint
                self.backgroundImage = profile.defaultBackgroundImage
                self.shadowImage = profile.defaultShadowImage
                self.selectionIndicatorImage = profile.defaultSelectionImage
            }
        }
    }
}

// MARK: -Tab Bar Item
extension UITabBarItem {
    public func enableTheme(profile: UIThemeProfile.tabbaritem, animated: Bool = true) throws {
        if profile.elementType != .tabbaritem {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                if #available(iOS 10.0, *) {
                    self.badgeColor = profile.themeBadge
                }
                self.selectedImage = profile.themeSelectedImage
                self.image = profile.themeImage
                self.landscapeImagePhone = profile.themeLandscapeImage
                if #available(iOS 11.0, *) {
                    self.largeContentSizeImage = profile.themeLargeContentImage
                }
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.tabbaritem, animated: Bool = true) throws {
        if profile.elementType != .tabbaritem {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                if #available(iOS 10.0, *) {
                    self.badgeColor = profile.defaultBadge
                }
                self.selectedImage = profile.defaultSelectedImage
                self.image = profile.defaultImage
                self.landscapeImagePhone = profile.defaultLandscapeImage
                if #available(iOS 11.0, *) {
                    self.largeContentSizeImage = profile.defaultLargeContentImage
                }
            }
        }
    }
}

// MARK: -Search Bar
extension UISearchBar {
    @available(*, unavailable)
    @objc override public func enableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    @available(*, unavailable)
    @objc override public func disableTheme(profile: UIThemeProfile.view, animated: Bool = true) throws {
        return
    }
    
    public func enableTheme(profile: UIThemeProfile.searchbar, animated: Bool = true) throws {
        if profile.elementType != .searchbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeImage != nil {
                    for state in profile.themeImage! {
                        self.setImage(state.iconImage, for: state.icon, state: state.controlState)
                    }
                }
                if profile.themeBackgroundImage != nil {
                    let background = profile.themeBackgroundImage!
                    self.setBackgroundImage(background.image, for: background.position, barMetrics: background.metrics)
                }
                if profile.themeSearchFieldBackgroundImage != nil {
                    for state in profile.themeSearchFieldBackgroundImage! {
                        self.setSearchFieldBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.themeScopeBarButtonBackground != nil {
                    for state in profile.themeScopeBarButtonBackground! {
                        self.setScopeBarButtonBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.themeScopeBarButtonTitleAttributes != nil {
                    for state in profile.themeScopeBarButtonTitleAttributes! {
                        self.setScopeBarButtonTitleTextAttributes(state.attributes, for: state.controlState)
                    }
                }
                if profile.themeScopeBarButtonDivider != nil {
                    for state in profile.themeScopeBarButtonDivider! {
                        self.setScopeBarButtonDividerImage(state.image, forLeftSegmentState: state.leftSegmentState, rightSegmentState: state.rightSegmentState)
                    }
                }
                if profile.themeBarStyle != nil {
                    self.barStyle = profile.themeBarStyle!
                }
                if profile.themeSearchBarStyle != nil {
                    self.searchBarStyle = profile.themeSearchBarStyle!
                }
                self.isTranslucent = profile.themeIsTranslucent
                self.barTintColor = profile.themeBarTint
            }
        }
    }
    
    public func disableTheme(profile: UIThemeProfile.searchbar, animated: Bool = true) throws {
        if profile.elementType != .searchbar {
            throw UIThemeError.wrongProfileType
        } else {
            var t: TimeInterval = 0
            if animated {
                t = profile.animateTime
            }
            UIView.animate(withDuration: t) {
                self.backgroundColor = profile.themeBackground
                if profile.themeTint != nil {
                    self.tintColor = profile.themeTint
                }
                if profile.themeImage != nil {
                    for state in profile.themeImage! {
                        self.setImage(state.iconImage, for: state.icon, state: state.controlState)
                    }
                }
                if profile.themeBackgroundImage != nil {
                    let background = profile.themeBackgroundImage!
                    self.setBackgroundImage(background.image, for: background.position, barMetrics: background.metrics)
                }
                if profile.themeSearchFieldBackgroundImage != nil {
                    for state in profile.themeSearchFieldBackgroundImage! {
                        self.setSearchFieldBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.themeScopeBarButtonBackground != nil {
                    for state in profile.themeScopeBarButtonBackground! {
                        self.setScopeBarButtonBackgroundImage(state.key, for: state.value)
                    }
                }
                if profile.themeScopeBarButtonTitleAttributes != nil {
                    for state in profile.themeScopeBarButtonTitleAttributes! {
                        self.setScopeBarButtonTitleTextAttributes(state.attributes, for: state.controlState)
                    }
                }
                if profile.themeScopeBarButtonDivider != nil {
                    for state in profile.themeScopeBarButtonDivider! {
                        self.setScopeBarButtonDividerImage(state.image, forLeftSegmentState: state.leftSegmentState, rightSegmentState: state.rightSegmentState)
                    }
                }
                if profile.themeBarStyle != nil {
                    self.barStyle = profile.themeBarStyle!
                }
                if profile.themeSearchBarStyle != nil {
                    self.searchBarStyle = profile.themeSearchBarStyle!
                }
                self.isTranslucent = profile.themeIsTranslucent
                self.barTintColor = profile.themeBarTint
            }
        }
    }
}

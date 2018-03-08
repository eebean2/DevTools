/*
 * UIThemeElement
 *
 * Created by Erik Bean on 3/5/18
 * Copyright © 2018 Erik Bean
 */

import UIKit

public typealias ThemeElement = AnyObject

public class UIThemeElement: NSObject {
    public var element: ThemeElement
    public var profile: UIThemeProfile
    
    /// Create a new themed element
    ///
    /// - paramaters:
    ///     - element: The UI element to be themed
    ///     - profile: The UIThemeProfile for the UI element to be custimized
    public init(element: ThemeElement, profile: UIThemeProfile) {
        self.element = element
        self.profile = profile
        super.init()
    }
    
    /// Enable the objects theme
    ///
    /// - throws: An error of type UIThemeError
    ///
    /// - paramaters animated: Default = true, animates the transition between themes
    public final func enableTheme(animated: Bool = true) throws {
        switch element.self {
        case is UIView:
            if profile.elementType != .view {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIView
                try element.enableTheme(profile: profile as! UIThemeProfile.view, animated: animated)
            }
        case is UILabel:
            if profile.elementType != .label {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UILabel
                try element.enableTheme(profile: profile as! UIThemeProfile.label, animated: animated)
            }
        case is UIButton:
            if profile.elementType != .button {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIButton
                try element.enableTheme(profile: profile as! UIThemeProfile.button, animated: animated)
            }
        case is UITextField:
            if profile.elementType != .textfield {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITextField
                try element.enableTheme(profile: profile as! UIThemeProfile.textfield, animated: animated)
            }
        case is UISlider:
            if profile.elementType != .slider {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISlider
                try element.enableTheme(profile: profile as! UIThemeProfile.slider, animated: animated)
            }
        case is UISwitch:
            if profile.elementType != .switch {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISwitch
                try element.enableTheme(profile: profile as! UIThemeProfile.`switch`, animated: animated)
            }
        case is UIActivityIndicatorView:
            if profile.elementType != .activityindicator {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIActivityIndicatorView
                try element.enableTheme(profile: profile as! UIThemeProfile.activityindicator, animated: animated)
            }
        case is UIProgressView:
            if profile.elementType != .progressbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIProgressView
                try element.enableTheme(profile: profile as! UIThemeProfile.progressbar, animated: animated)
            }
        case is UIPageControl:
            if profile.elementType != .pagecontrol {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIPageControl
                try element.enableTheme(profile: profile as! UIThemeProfile.pagecontrol, animated: animated)
            }
        case is UIStepper:
            if profile.elementType != .stepper {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIStepper
                try element.enableTheme(profile: profile as! UIThemeProfile.stepper, animated: animated)
            }
        case is UISegmentedControl:
            if profile.elementType != .segmentedcontroller {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISegmentedControl
                try element.enableTheme(profile: profile as! UIThemeProfile.segmentedcontroller, animated: animated)
            }
        case is UITableView:
            if profile.elementType != .tableview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITableView
                try element.enableTheme(profile: profile as! UIThemeProfile.tableview, animated: animated)
            }
        case is UITableViewCell:
            if profile.elementType != .tableviewcell {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITableViewCell
                try element.enableTheme(profile: profile as! UIThemeProfile.tableviewcell, animated: animated)
            }
        case is UIImageView:
            if profile.elementType != .imageview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIImageView
                try element.enableTheme(profile: profile as! UIThemeProfile.imageview, animated: animated)
            }
        case is UICollectionView:
            if profile.elementType != .collectionview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UICollectionView
                try element.enableTheme(profile: profile as! UIThemeProfile.collectionview, animated: animated)
            }
        case is UICollectionViewCell:
            if profile.elementType != .collectionviewcell {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UICollectionViewCell
                try element.enableTheme(profile: profile as! UIThemeProfile.collectionviewcell, animated: animated)
            }
        case is UITextView:
            if profile.elementType != .textview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITextView
                try element.enableTheme(profile: profile as! UIThemeProfile.textview, animated: animated)
            }
        case is UIScrollView:
            if profile.elementType != .scrollview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIScrollView
                try element.enableTheme(profile: profile as! UIThemeProfile.scrollview, animated: animated)
            }
        case is UIDatePicker:
            if profile.elementType != .datepicker {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIDatePicker
                try element.enableTheme(profile: profile as! UIThemeProfile.datepicker, animated: animated)
            }
        case is UIPickerView:
            if profile.elementType != .pickerview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIPickerView
                try element.enableTheme(profile: profile as! UIThemeProfile.pickerview, animated: animated)
            }
        case is UINavigationBar:
            if profile.elementType != .navigationbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UINavigationBar
                try element.enableTheme(profile: profile as! UIThemeProfile.navigationbar, animated: animated)
            }
        case is UIToolbar:
            if profile.elementType != .toolbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIToolbar
                try element.enableTheme(profile: profile as! UIThemeProfile.toolbar, animated: animated)
            }
        case is UITabBar:
            if profile.elementType != .tabbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITabBar
                try element.enableTheme(profile: profile as! UIThemeProfile.tabbar, animated: animated)
            }
        case is UIBarButtonItem:
            if profile.elementType != .barbuttonitem {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIBarButtonItem
                try element.enableTheme(profile: profile as! UIThemeProfile.barbuttonitem, animated: animated)
            }
        case is UITabBarItem:
            if profile.elementType != .tabbaritem {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITabBarItem
                try element.enableTheme(profile: profile as! UIThemeProfile.tabbaritem, animated: animated)
            }
        case is UISearchBar:
            if profile.elementType != .searchbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISearchBar
                try element.enableTheme(profile: profile as! UIThemeProfile.searchbar, animated: animated)
            }
        default:
            throw UIThemeError.unsupportedType
        }
    }
    
    /// Disable the objects theme
    ///
    /// - throws: An error of type UIThemeError
    ///
    /// - paramaters animated: Default = true, animates the transition between themes
    public final func disableTheme(animated: Bool = true) throws {
        switch element.self {
        case is UIView:
            if profile.elementType != .view {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIView
                try element.disableTheme(profile: profile as! UIThemeProfile.view, animated: animated)
            }
        case is UILabel:
            if profile.elementType != .label {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UILabel
                try element.disableTheme(profile: profile as! UIThemeProfile.label, animated: animated)
            }
        case is UIButton:
            if profile.elementType != .button {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIButton
                try element.disableTheme(profile: profile as! UIThemeProfile.button, animated: animated)
            }
        case is UITextField:
            if profile.elementType != .textfield {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITextField
                try element.disableTheme(profile: profile as! UIThemeProfile.textfield, animated: animated)
            }
        case is UISlider:
            if profile.elementType != .slider {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISlider
                try element.disableTheme(profile: profile as! UIThemeProfile.slider, animated: animated)
            }
        case is UISwitch:
            if profile.elementType != .switch {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISwitch
                try element.disableTheme(profile: profile as! UIThemeProfile.`switch`, animated: animated)
            }
        case is UIActivityIndicatorView:
            if profile.elementType != .activityindicator {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIActivityIndicatorView
                try element.disableTheme(profile: profile as! UIThemeProfile.activityindicator, animated: animated)
            }
        case is UIProgressView:
            if profile.elementType != .progressbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIProgressView
                try element.disableTheme(profile: profile as! UIThemeProfile.progressbar, animated: animated)
            }
        case is UIPageControl:
            if profile.elementType != .pagecontrol {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIPageControl
                try element.disableTheme(profile: profile as! UIThemeProfile.pagecontrol, animated: animated)
            }
        case is UIStepper:
            if profile.elementType != .stepper {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIStepper
                try element.disableTheme(profile: profile as! UIThemeProfile.stepper, animated: animated)
            }
        case is UISegmentedControl:
            if profile.elementType != .segmentedcontroller {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISegmentedControl
                try element.disableTheme(profile: profile as! UIThemeProfile.segmentedcontroller, animated: animated)
            }
        case is UITableView:
            if profile.elementType != .tableview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITableView
                try element.disableTheme(profile: profile as! UIThemeProfile.tableview, animated: animated)
            }
        case is UITableViewCell:
            if profile.elementType != .tableviewcell {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITableViewCell
                try element.disableTheme(profile: profile as! UIThemeProfile.tableviewcell, animated: animated)
            }
        case is UIImageView:
            if profile.elementType != .imageview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIImageView
                try element.disableTheme(profile: profile as! UIThemeProfile.imageview, animated: animated)
            }
        case is UICollectionView:
            if profile.elementType != .collectionview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UICollectionView
                try element.disableTheme(profile: profile as! UIThemeProfile.collectionview, animated: animated)
            }
        case is UICollectionViewCell:
            if profile.elementType != .collectionviewcell {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UICollectionViewCell
                try element.disableTheme(profile: profile as! UIThemeProfile.collectionviewcell, animated: animated)
            }
        case is UITextView:
            if profile.elementType != .textview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITextView
                try element.disableTheme(profile: profile as! UIThemeProfile.textview, animated: animated)
            }
        case is UIScrollView:
            if profile.elementType != .scrollview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIScrollView
                try element.disableTheme(profile: profile as! UIThemeProfile.scrollview, animated: animated)
            }
        case is UIDatePicker:
            if profile.elementType != .datepicker {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIDatePicker
                try? element.disableTheme(profile: profile as! UIThemeProfile.datepicker, animated: animated)
            }
        case is UIPickerView:
            if profile.elementType != .pickerview {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIPickerView
                try element.disableTheme(profile: profile as! UIThemeProfile.pickerview, animated: animated)
            }
        case is UINavigationBar:
            if profile.elementType != .navigationbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UINavigationBar
                try element.disableTheme(profile: profile as! UIThemeProfile.navigationbar, animated: animated)
            }
        case is UIToolbar:
            if profile.elementType != .toolbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIToolbar
                try? element.disableTheme(profile: profile as! UIThemeProfile.toolbar, animated: animated)
            }
        case is UITabBar:
            if profile.elementType != .tabbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITabBar
                try? element.disableTheme(profile: profile as! UIThemeProfile.tabbar, animated: animated)
            }
        case is UIBarButtonItem:
            if profile.elementType != .barbuttonitem {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UIBarButtonItem
                try? element.disableTheme(profile: profile as! UIThemeProfile.barbuttonitem, animated: animated)
            }
        case is UITabBarItem:
            if profile.elementType != .tabbaritem {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UITabBarItem
                try element.disableTheme(profile: profile as! UIThemeProfile.tabbaritem, animated: animated)
            }
        case is UISearchBar:
            if profile.elementType != .searchbar {
                throw UIThemeError.wrongProfileType
            } else {
                let element = self.element as! UISearchBar
                try element.disableTheme(profile: profile as! UIThemeProfile.searchbar, animated: animated)
            }
        default:
            throw UIThemeError.unsupportedType
        }
    }
}


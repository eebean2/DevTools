//
//  UIThemeElement.swift
//  UITheme
//
//  Created by Erik Bean on 2/8/18.
//  Copyright © 2018 Brick Water Studios. All rights reserved.
//

import UIKit

// MARK: -UIThemeProfileType
public enum UIThemeProfileType {
    /// UIView
    case view
    /// UILabel
    case label
    /// UIButton
    case button
    /// UITextField
    case textfield
    /// UISlider
    case slider
    /// UISwitch
    case `switch`
    /// UIActivityIndicatorView
    case activityindicator
    /// UIProgressBar
    case progressbar
    /// UIPageControl
    case pagecontrol
    /// UIStepper
    case stepper
    /// UISegmentedController
    case segmentedcontroller
    /// UITableView
    case tableview
    /// UITableViewCell
    case tableviewcell
    /// UIImageView
    case imageview
    /// UICollectionView
    case collectionview
    /// UICollectionViewCell
    case collectionviewcell
    /// UITextView
    case textview
    /// UIScrollView
    case scrollview
    /// UIDatePicker
    case datepicker
    /// UIPickerView
    case pickerview
    /// UINavigationBar
    case navigationbar
    /// UIToolBar
    case toolbar
    /// UIBarButtonItem
    case barbuttonitem
    /// UITabBar
    case tabbar
    /// UITabBarItem
    case tabbaritem
    /// UISearchBar
    case searchbar
    /// Unsupported item, will require manual theme support
    case other
    /// Data uninitilized, will require initilization to work
    case uninit
}

// MARK: -UIThemeProfile
@objc public class UIThemeProfile: NSObject {
    
    public var elementType: UIThemeProfileType = .uninit
    public var statusBar: Bool = false
    public var animateTime: TimeInterval = 0.5
    
    // MARK: -View
    public class view: UIThemeProfile {
        public var defaultBackground: UIColor?
        public var themeBackground: UIColor?
        public var defaultTint: UIColor?
        public var themeTint: UIColor?
        
        public init(defaultBackground: UIColor, themeBackground: UIColor) {
            super.init()
            super.elementType = .view
            self.defaultBackground = defaultBackground
            self.themeBackground = themeBackground
        }
    }
    
    // MARK: -Label
    public class label: view {
        public var defaultText: String?
        public var themeText: String?
        public var defaultTextColor: UIColor?
        public var themeTextColor: UIColor?
        public var defaultShadow: UIColor?
        public var themeShadow: UIColor?
        public var defaultHighlight: UIColor?
        public var themeHighlight: UIColor?
        public var defaultAttributedText: NSMutableAttributedString?
        public var themeAttributedText: NSMutableAttributedString?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .label
        }
        
        convenience public init(defaultTextColor: UIColor, themeTextColor: UIColor) {
            self.init()
            self.defaultTextColor = defaultTextColor
            self.themeTextColor = themeTextColor
        }
    }
    
    // MARK: -Button
    public class button: view {
        public var defaultTitle: [String: UIControlState]?
        public var themeTitle: [String: UIControlState]?
        public var defaultImage: [UIImage: UIControlState]?
        public var themeImage: [UIImage: UIControlState]?
        public var defaultTitleColor: [UIColor: UIControlState]?
        public var themeTitleColor: [UIColor: UIControlState]?
        public var defaultAttributedTitle: [NSMutableAttributedString: UIControlState]?
        public var themeAttributedTitle: [NSMutableAttributedString: UIControlState]?
        public var defaultBackgroundImage: [UIImage: UIControlState]?
        public var themeBackgroundImage: [UIImage: UIControlState]?
        public var defaultTitleShadowColor: [UIColor: UIControlState]?
        public var themeTitleShadowColor: [UIColor: UIControlState]?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .button
        }
    }
    
    // MARK: -Textfield
    public class textfield: view {
        public var defaultTextColor: UIColor?
        public var themeTextColor: UIColor?
        public var defaultAttributedText: NSMutableAttributedString?
        public var themeAttributedText: NSMutableAttributedString?
        public var defaultBackgroundImage: UIImage?
        public var themeBackgroundImage: UIImage?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .textfield
        }
    }
    
    // MARK: -Slider
    public class slider: view {
        public var defaultThumbImage: [UIImage: UIControlState]?
        public var themeThumbImage: [UIImage: UIControlState]?
        public var defaultMinTrackImage: [UIImage: UIControlState]?
        public var themeMinTrackImage: [UIImage: UIControlState]?
        public var defaultMaxTrackImage: [UIImage: UIControlState]?
        public var themeMaxTrackImage: [UIImage: UIControlState]?
        public var defaultMinTrackColor: UIColor?
        public var themeMinTrackColor: UIColor?
        public var defaultMaxTrackColor: UIColor?
        public var themeMaxTrackColor: UIColor?
        public var defaultThumbTint: UIColor?
        public var themeThumbTint: UIColor?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .slider
        }
    }
    
    public class activityindicator: view {
        public var defaultStyle: UIActivityIndicatorViewStyle?
        public var themeStyle: UIActivityIndicatorViewStyle?
        public var defaultColor: UIColor?
        public var themeColor: UIColor?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .activityindicator
        }
    }
    
    // MARK: -Switch
    public class `switch`: view {
        public var defaultOnTint: UIColor?
        public var themeOnTint: UIColor?
        public var defaultOnImage: UIImage?
        public var themeOnImage: UIImage?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .switch
        }
    }
    
    // MARK: -Progress Bar
    public class progressbar: view {
        public var defaultProgressTint: UIColor?
        public var themeProgressTint: UIColor?
        public var defaultTrackTink: UIColor?
        public var themeTrackTint: UIColor?
        public var defaultProgressImage: UIImage?
        public var themeProgressImage: UIImage?
        public var defaultTrackImage: UIImage?
        public var themeTrackImage: UIImage?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .progressbar
        }
    }
    
    // MARK: -Page Control
    public class pagecontrol: view {
        public var defaultPagesColor: UIColor?
        public var themePagesColor: UIColor?
        public var defaultCurrentPageColor: UIColor?
        public var themeCurrentPageColor: UIColor?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .pagecontrol
        }
        
        convenience public init(defaultPagesColor: UIColor, themePagesColor: UIColor, defaultCurrentPageColor: UIColor, themeCurrentPageColor: UIColor) {
            self.init()
            self.defaultPagesColor = defaultPagesColor
            self.themePagesColor = themePagesColor
            self.defaultCurrentPageColor = defaultCurrentPageColor
            self.themeCurrentPageColor = themeCurrentPageColor
        }
    }
    
    // MARK: -Stepper
    public class stepper: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .stepper
        }
    }
    
    public class segmentedcontroller: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .segmentedcontroller
        }
    }
    
    // MARK: -TableView
    public class tableview: view {
        override public init(defaultBackground: UIColor, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .tableview
        }
    }
    
    // MARK: -TableView Cell
    public class tableviewcell: view {
        override public init(defaultBackground: UIColor, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .tableviewcell
        }
    }
    
    // MARK: -Image View
    public class imageview: view {
        public var defaultImage: UIImage?
        public var themeImage: UIImage?
        public var defaultHighlight: UIImage?
        public var themeHighlight: UIImage?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .imageview
        }
    }
    
    // MARK: -Collection View
    public class collectionview: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .collectionview
        }
    }
    
    // MARK: -Collection View Cell
    public class collectionviewcell: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .collectionviewcell
        }
    }
    
    // MARK: -Textview
    public class textview: view {
        public var defaultTextColor: UIColor?
        public var themeTextColor: UIColor?
        public var defaultAttributedText: NSMutableAttributedString?
        public var themeAttributedText: NSMutableAttributedString?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .textview
        }
    }
    
    // MARK: -Scrollview
    public class scrollview: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .scrollview
        }
    }
    
    // MARK: -Datepicker
    public class datepicker: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .datepicker
        }
    }
    
    // MARK: -Pickerview
    public class pickerview: view {
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .pickerview
        }
    }
    
    // Navigation Bar is very intensive, and the last objective
    
    // MARK: -Navigation Bar
    public class navigationbar: view {
        public var defaultBackgroundImageWithPosition: (image: UIImage, position: UIBarPosition, metrics: UIBarMetrics)?
        public var themeBackgroundImageWithPosition: (image: UIImage, position: UIBarPosition, metrics: UIBarMetrics)?
        public var defaultBackgroundImage: [UIImage: UIBarMetrics]?
        public var themeBackgroundImage: [UIImage: UIBarMetrics]?
        public var defaultItems: [UINavigationItem]?
        public var themeItems: [UINavigationItem]?
        public var defaultBarStyle: UIBarStyle?
        public var themeBarStyle: UIBarStyle?
        public var defaultIsTranslucent: Bool = true
        public var themeIsTranslucent: Bool = false
        public var defaultBarTint: UIColor?
        public var themeBarTint: UIColor?
        public var defaultShadowImage: UIImage?
        public var themeShadowImage: UIImage?
        public var defaultBackImage: UIImage?
        public var themeBackImage: UIImage?
        public var defaultTitleTextAttributes: [NSAttributedStringKey: Any]?
        public var themeTitleTextAttributes: [NSAttributedStringKey: Any]?
        public var defaultLargeTitleTextAttributes: [NSAttributedStringKey: Any]?
        public var themeLargeTitleTextAttributes: [NSAttributedStringKey: Any]?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .navigationbar
        }
    }
    
    // MARK: -Toolbar
    public class toolbar: view {
        public var defaultBarStyle: UIBarStyle = .default
        public var themeBarStyle: UIBarStyle = .default
        public var defaultIsTranslucent: Bool = true
        public var themeIsTranslucent: Bool =  true
        public var defaultBarTint: UIColor?
        public var themeBarTint: UIColor?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .toolbar
        }
    }
    
    // MARK: -Bar Button Item
    public class barbuttonitem: UIThemeProfile {
        public var defaultBackgroundImageWithStyle: [(image: UIImage, controlState: UIControlState, style: UIBarButtonItemStyle, metrics: UIBarMetrics)]?
        public var themeBackgroundImageWithStyle: [(image: UIImage, controlState: UIControlState, style: UIBarButtonItemStyle, metrics: UIBarMetrics)]?
        public var defaultBackgroundImage: [(image: UIImage, controlState: UIControlState, metrics: UIBarMetrics)]?
        public var themeBackgroundImage: [(image: UIImage, controlState: UIControlState, metrics: UIBarMetrics)]?
        public var defaultBackButtonBackgroundImage: [(image: UIImage, controlState: UIControlState, metrics: UIBarMetrics)]?
        public var themeBackButtonBackgroundImage: [(image: UIImage, controlState: UIControlState, metrics: UIBarMetrics)]?
        public var defaultTitleTextAttributes: [(attributes: [NSAttributedStringKey: Any], controlState: UIControlState)]?
        public var themeTitleTextAttributes: [(attributes: [NSAttributedStringKey: Any], controlState: UIControlState)]?
        public var defaultBarStyle: UIBarButtonItemStyle?
        public var themeBarStyle: UIBarButtonItemStyle?
        public var defaultTint: UIColor?
        public var themeTint: UIColor?
        public var defaultImage: UIImage?
        public var themeImage: UIImage?
        public var defaultLandscapeImage: UIImage?
        public var themeLandscapeImage: UIImage?
        public var defaultLargeContentImage: UIImage?
        public var themeLargeContentImage: UIImage?
        
        public override init() {
            super.init()
            super.elementType = .barbuttonitem
        }
    }
    
    // MARK: -Tab Bar
    public class tabbar: view {
        public var defaultBackgroundImage: UIImage?
        public var themeBackgroundImage: UIImage?
        public var defaultShadowImage: UIImage?
        public var themeShadowImage: UIImage?
        public var defaultSelectionImage: UIImage?
        public var themeSelectionImage: UIImage?
        public var defaultBarStyle: UIBarStyle = .default
        public var themeBarStyle: UIBarStyle = .default
        public var defaultIsTranslucent: Bool = true
        public var themeIsTranslucent: Bool = true
        public var defaultBarTint: UIColor?
        public var themeBarTint: UIColor?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .tabbar
        }
    }
    
    // MARK: -Tab Bar Item
    public class tabbaritem: UIThemeProfile {
        public var defaultBadge: UIColor?
        public var themeBadge: UIColor?
        public var defaultSelectedImage: UIImage?
        public var themeSelectedImage: UIImage?
        public var defaultImage: UIImage?
        public var themeImage: UIImage?
        public var defaultLandscapeImage: UIImage?
        public var themeLandscapeImage: UIImage?
        public var defaultLargeContentImage: UIImage?
        public var themeLargeContentImage: UIImage?
        
        public override init() {
            super.init()
            super.elementType = .tabbaritem
        }
    }
    
    // MARK: -Search Bar
    public class searchbar: view {
        public var defaultImage: [(iconImage: UIImage, icon: UISearchBarIcon, controlState: UIControlState)]?
        public var themeImage: [(iconImage: UIImage, icon: UISearchBarIcon, controlState: UIControlState)]?
        public var defaultBackgroundImage: (image: UIImage, position: UIBarPosition, metrics: UIBarMetrics)?
        public var themeBackgroundImage: (image: UIImage, position: UIBarPosition, metrics: UIBarMetrics)?
        public var defaultSearchFieldBackgroundImage: [UIImage: UIControlState]?
        public var themeSearchFieldBackgroundImage: [UIImage: UIControlState]?
        public var defaultScopeBarButtonBackground: [UIImage: UIControlState]?
        public var themeScopeBarButtonBackground: [UIImage: UIControlState]?
        public var defaultScopeBarButtonTitleAttributes: [(attributes: [String: Any], controlState: UIControlState)]?
        public var themeScopeBarButtonTitleAttributes: [(attributes: [String: Any], controlState: UIControlState)]?
        public var defaultScopeBarButtonDivider: [(image: UIImage, leftSegmentState: UIControlState, rightSegmentState: UIControlState)]?
        public var themeScopeBarButtonDivider: [(image: UIImage, leftSegmentState: UIControlState, rightSegmentState: UIControlState)]?
        public var defaultSearchBarStyle: UISearchBarStyle?
        public var themeSearchBarStyle: UISearchBarStyle?
        public var defaultBarStyle: UIBarStyle?
        public var themeBarStyle: UIBarStyle?
        public var defaultIsTranslucent: Bool = true
        public var themeIsTranslucent: Bool = true
        public var defaultBarTint: UIColor?
        public var themeBarTint: UIColor?
        
        override public init(defaultBackground: UIColor = .clear, themeBackground: UIColor = .clear) {
            super.init(defaultBackground: defaultBackground, themeBackground: themeBackground)
            super.elementType = .textfield
        }
    }
}



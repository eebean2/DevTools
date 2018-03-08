//
//  HomeThemeManager.swift
//  DevTools
//
//  Created by Erik Bean on 8/18/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DevTools

extension ViewController {
    
    @IBAction func changeTheme(_ sender: UIButton) {
        let titleProfile = UIThemeProfile.label(defaultTextColor: .black, themeTextColor: .white)
        let title = UIThemeElement(element: dtTitle, profile: titleProfile)
        do {
//            try dtTitle.enableTheme(profile: titleProfile)
            try title.enableTheme()
        } catch let error {
            print(error.localizedDescription)
        }
        let backProfile = UIThemeProfile.view(defaultBackground: .groupTableViewBackground, themeBackground: .black)
        backProfile.statusBar = true
        let background = UIThemeElement(element: view, profile: backProfile)
        try! background.enableTheme()
//        if !manager.isThemeOn {
//            do {
//                try manager.enableTheme(animated: false)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        } else {
//            do {
//                try manager.disableTheme()
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }
    }
}

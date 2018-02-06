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
        let title = UIThemeElement(dtTitle, lightColor: .black, darkColor: .white)
        let background = UIThemeElement(view, lightColor: .groupTableViewBackground, darkColor: .black)
        if isDarkMode {
            UIView.animate(withDuration: 0.5, animations: {
                background.disableDarkMode()
                self.isDarkMode = false
            })
            UIView.animate(withDuration: 1.5, animations: {
                title.disableDarkMode()
                self.manager.setStatusBar(.default)
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                background.enableDarkMode()
                self.isDarkMode = true
            })
            UIView.animate(withDuration: 1.5, animations: { 
                title.enableDarkMode()
                self.manager.setStatusBar(.lightContent)
            })
        }
    }
}

//
//  TestingViewController.swift
//  DevTools
//
//  Created by Erik Bean on 8/18/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DevTools

class TestingViewController: UIViewController, UIThemeDelegate {
    
    @IBOutlet var label: UILabel!
    
    let manager = UIThemeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// The current local user inistance
        let user = DevUser.current
        try! user.addData(key: userAge, data: 23)
        try! user.addData(key: userGender, data: false)
        try! user.addData(key: userFirstName, data: "Erik")
        try! user.addData(key: userProfilePicture, data: UIImage())
        try! user.addData(key: userToken, data: "kjsaghpopaijlkajsdkjfkjdkl;a--2017")
        
        manager.delegate = self
        
        manager.add(manager.set(object: view, toTheme: .homebrew))
        manager.add(manager.set(object: label, toTheme: .homebrew))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Still in testing
//    @IBAction func presentNotification(_ sender: UIButton) {
//        let notif = DevNotification(onView: view)
//        if manager.isDarkMode {
//            notif.backgroundColor = .white
//            notif.borderShadow = UIColor.white.cgColor
//            notif.borderColor = UIColor.lightGray.cgColor
//        }
//        notif.present(notification: NotificationInfo())
//    }

    @IBAction func switchTheme(_ sender: UIButton) {
        if manager.isDarkMode {
            manager.disableThemes()
        } else {
            manager.enableDarkMode()
        }
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func error(_ message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func themeWillChange() {
        print("Theme Will Change")
    }
    
    func themeDidNotChange(error: Error) {
        print("Theme Did Not Change: \(error.localizedDescription)")
    }

    func themeDidChange() {
        print("Theme Did Change")
    }
}

//
//  ViewController.swift
//  DevTools
//
//  Created by eebean2 on 05/03/2017.
//  Copyright (c) 2017 eebean2. All rights reserved.
//

import UIKit
import DevTools

class ViewController: UIViewController {
    
    // Title
    @IBOutlet var dtTitle: UILabel!
    
    /// UITheme Manager
    let manager = UITheme.manager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup our theme elements and add them to the theme pool
        let titleProfile = UIThemeProfile.label(defaultTextColor: .black, themeTextColor: .white)
        let title = UIThemeElement(element: dtTitle, profile: titleProfile)
        let backProfile = UIThemeProfile.view(defaultBackground: .groupTableViewBackground, themeBackground: .black)
        backProfile.statusBar = true
        let background = UIThemeElement(element: view, profile: backProfile)
        manager.addToPool([title, background])
    }
    
    /*
        A demo console will be created here
     */
    @IBAction func console(_ sender: UIButton) {
        performSegue(withIdentifier: "consoleSegue", sender: self)
    }
    
    /*
        Here is DevTools remake of Toast. Currently works similarly
     */
    var tPresent = false   // Checks if Toast is present
    let t = Toast()       // Our Toast modual
    @IBAction func toast(_ sender: UIButton) {
        if tPresent {
            
            // Remove Toast from the view
            t.remove()
            
            // Set see to not present
            tPresent = false
        } else {
            
            // Set the Title
            t.primary.text = "I'm Toast"
            
            // Set the message
            t.primaryTitle.text = "Hello"
            
            // Add Toast to the view
            t.addTo(self)
            
            // Set see to present
            tPresent = true
        }
    }
    
    /*
        Here we give a basic example of Core.
        Note the output in the Console below.
     
        You can access each individual item printed
        by calling Core.[item name]. If you cannot
        find it, see the documentation in the example app!
     */
    @IBAction func core(_ sender: UIButton) {
        
        // Check if we are on simulator
        if DevCore().isSimulator {
            
            // Check if we are able to run most of Core
            if DevCore.isAvailable() {
                
                // We are, print error for Telephony
                DevCore.logError("You need to be on an iPhone or iPad to succesfully use the Core Sample for Telephony!")
            } else {
                /*
                    We are not able to run most of Core
                    logError and logTelephony cannot be ran,
                    we resort to printWarning for both
                 */
                DevCore.logWarning("You are not using a compatible operating system, please use OSX 10.0 or newer, iOS 2.0 or newer, tvOS 9.0 or newer, or watchOS 2.0 or newer!")
                DevCore.logWarning("You need to be on an iPhone or iPad with a compatible version of iOS to succesfully use the Core Sample for Telephony!")
            }
        }
        
        /*
            Because we are running a sample, we will still run
            logTelephony if possible to show the error result
            
            This is not ideal on simulator due to the excesive logs
         */
        if DevCore.isAvailable() {
            DevCore().logTelephony()
        }
        
        // Here we log the device information
        DevCore().logDevice()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if tPresent {
            t.remove()
        }
    }
}


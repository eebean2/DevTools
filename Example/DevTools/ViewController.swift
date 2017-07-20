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
    
    /*
        Our simple setup, this code is only for the
        documentation and can be safely ignored
     */
    var sDocs = [SuperDoc]()
    var detail = [Doc]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
    }
    /*
        A demo console will be created here
     */
    @IBAction func console(_ sender: UIButton) {
        
    }
    
    /*
        Here is DevTools remake of Toast. Currently works similarly
     */
    var siPresent = false   // Checks if Sierra is present
    let si = Sierra()       // Our Sierra modual
    @IBAction func sierra(_ sender: UIButton) {
        if siPresent {
            
            // Remove Sierra from the view
            si.remove()
            
            // Set see to not present
            siPresent = false
        } else {
            
            // Set the Title
            si.primary.text = "I'm Sierra"
            
            // Set the message
            si.primaryTitle.text = "Hello"
            
            // Add Sierra to the view
            si.addTo(self)
            
            // Set see to present
            siPresent = true
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
        if Core().isSimulator {
            
            // Check if we are able to run most of Core
            if Core.isAvailable() {
                
                // We are, print error for Telephony
                Core.logError("You need to be on an iPhone or iPad to succesfully use the Core Sample for Telephony!")
            } else {
                /*
                    We are not able to run most of Core
                    logError and logTelephony cannot be ran,
                    we resort to printWarning for both
                 */
                Core.logWarning("You are not using a compatible operating system, please use OSX 10.0 or newer, iOS 2.0 or newer, tvOS 9.0 or newer, or watchOS 2.0 or newer!")
                Core.logWarning("You need to be on an iPhone or iPad with a compatible version of iOS to succesfully use the Core Sample for Telephony!")
            }
        }
        
        /*
            Because we are running a sample, we will still run
            logTelephony if possible to show the error result
            
            This is not ideal on simulator due to the excesive logs
         */
        if Core.isAvailable() {
            Core().logTelephony()
        }
        
        // Here we log the device information
        Core().logDevice()
    }
    
    // Private Code to fetch our documentation json file
    // Commented where DevTools is used
    private func fetchJSON() {
        do {
            if let file = Bundle.main.url(forResource: "v1_2", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let tools = json as? [String: Any] {
                    for tool in tools {
                        if let api = tool.value as? [String: Any] {
                            if tool.key == "Extensions" {
                                // Custom helper to handle the JSON
                                self.sDocs.append(SuperDoc(holder: api["api"] as! [String: Any], title: tool.key, warning: nil))
                                if let details = api["api"] as? [String: Any] {
                                    for dDoc in details {
                                        if let detail = dDoc.value as? [String: Any] {
                                            self.detail.append(Doc(title: detail["title"] as! String, type: detail["return"] as! String, message: detail["message"] as! String, restrictions: nil, warning: nil))
                                        }
                                    }
                                }
                            } else {
                                // Custom helper to handle the JSON
                                self.sDocs.append(SuperDoc(holder: api["api"] as! NSArray, title: tool.key, warning: api["warning"] as? String ?? nil))
                            }
                            // Helper supports protocol Comparable
                            sDocs.sort()
                        }
                    }
                } else {
                    // Core's custom print interface, "Log"
                    Core.logError("JSON is Invalid")
                }
            } else {
                // Core's custom print interface, "Log"
                Core.logError("No File Found")
            }
        } catch {
            // Core's custom print interface, "Log"
            Core.logError("JSON Error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Navigation
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let rvc = (segue.destination as? UINavigationController)?.topViewController as? DocumetationTableView {
            rvc.sDocs = self.sDocs
            rvc.detail = self.detail
        } else {
            // Core's custom print interface, "Log"
            Core.logError("Destination view controller wrong! (main to documentation)")
        }
    }
}


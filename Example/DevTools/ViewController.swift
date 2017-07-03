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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Core().logTelephony()
        Core().logDevice()
        
//      Console is not finished, please do not use
//
//        _ = Console(on: self, readOnly: true) { (console) in
//            console.printDiagnostic()
//        }
        
        let si = Sierra()
        si.primaryTitle.text = "Title"
        si.primary.text = "subtitle"
        si.addTo(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


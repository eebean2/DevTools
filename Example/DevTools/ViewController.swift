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
        
        let si = Sierra()
        si.primaryTitle.text = "Title"
        si.primary.text = "subtitle"
        si.addTo(view: view)
        
        Core().logTelephony()
        Core().logDevice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


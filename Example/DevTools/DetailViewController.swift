//
//  DetailViewController.swift
//  DevTools
//
//  Created by Erik Bean on 7/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var definition: UILabel!
    @IBOutlet var returns: UILabel!
    @IBOutlet var restrictions: UILabel!
    @IBOutlet var warning: UILabel!
    @IBOutlet var summary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = definition.text
        if warning.text == "" || warning.text == nil {
            warning.frame = CGRect(x: warning.frame.minX, y: warning.frame.minY, width: warning.frame.width, height: 0)
        } else {
            warning.sizeToFit()
        }
        if restrictions.text == "" || restrictions.text == nil {
            restrictions.text = "    none"
        } else {
            restrictions.sizeToFit()
        }
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

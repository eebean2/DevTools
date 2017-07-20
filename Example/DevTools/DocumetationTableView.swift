//
//  DocumetationTableView.swift
//  DevTools
//
//  Created by Erik Bean on 7/12/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DevTools

class DocumetationTableView: UITableViewController {
    
    public var sDocs = [SuperDoc]()
    public var detail = [Doc]()
    
    private var docs = [AnyObject]()
    
    var selectIndex = 0

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let doc = docs[indexPath.row] as? SuperDoc {
            if doc.title == "Extensions" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "extIdentifier", for: indexPath)
                cell.textLabel?.text = doc.title
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
                cell.textLabel?.text = doc.title
                if doc.warning != nil {
                    cell.detailTextLabel!.font = UIFont.systemFont(ofSize: 10)
                    cell.detailTextLabel?.text = "SEE WARNING"
                    cell.detailTextLabel?.textColor = .red
                } else {
                    cell.detailTextLabel?.text = ""
                }
                return cell
            }
        } else if let doc = docs[indexPath.row] as? Doc {
            print("I ran")
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailIdentifier", for: indexPath)
            cell.textLabel?.text = doc.title
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            Core.logError("Unknown Type Found")
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row > 3 && indexPath.row < docs.count {
            selectIndex = indexPath.row
            performSegue(withIdentifier: "toDetail", sender: self)
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let rvc = segue.destination as! DetailViewController
            rvc.definition.text = (docs[selectIndex] as! Doc).title
            rvc.returns.text = (docs[selectIndex] as! Doc).type
            rvc.restrictions.text = (docs[selectIndex] as! Doc).restrictions
            rvc.summary.text = (docs[selectIndex] as! Doc).message
            rvc.warning.text = (docs[selectIndex] as! Doc).warning
        }
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

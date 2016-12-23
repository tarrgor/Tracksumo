//
//  SettingsViewController.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 16/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController, Pageable, UITableViewDataSource, UITableViewDelegate {
    
    // tableView connection
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        // tableView config
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    // MARK: tableView number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // MARK: tableView cell content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as! UIActivityCell
        cell.activityName.text = "XCode Configuration"
        cell.activityCategory.text = "Coding"
        
        return cell
    }
    
    
    
    // MARK: Steppper
    
    @IBAction func stepperStartValueChanged(_ sender: UIStepper) {
        
        
    }

    
    @IBAction func stepperEndValueChanged(_ sender: UIStepper) {
    }
    
    
    let pageIndex: Int = 0
    
}

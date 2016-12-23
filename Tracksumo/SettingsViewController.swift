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
    
    // hourLabels connection
    @IBOutlet weak var startHourLabel: UILabel!
    @IBOutlet weak var endHourLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        // tableView config
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // hourLabels base values
        self.startHourLabel.text = "8:00"
        self.endHourLabel.text = "20:00"
        
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
    // Increasing and decreasing label values
    
    @IBAction func stepperStartValueChanged(_ sender: UIStepper) {
        changeHourLabelValue(label: startHourLabel, value: sender.value)
    }

    
    @IBAction func stepperEndValueChanged(_ sender: UIStepper) {
        changeHourLabelValue(label: endHourLabel, value: sender.value)
    }
    
    func changeHourLabelValue(label: UILabel, value: Double) {

        let dateHour = Int(value)
        
        if (value > Double(dateHour)) {
            label.text = "\(dateHour):30"
        } else {
            label.text = "\(dateHour):00"
        }
        
    }
    
    
    let pageIndex: Int = 0
    
}

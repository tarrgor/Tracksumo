//
//  SettingsViewController.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 16/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController, Pageable, UITableViewDataSource, UITableViewDelegate {
    
    // UIStepper connection
    @IBOutlet weak var dayStartStepper: UIStepper!
    @IBOutlet weak var dayEndStepper: UIStepper!
    
    // tableView connection
    @IBOutlet weak var tableView: UITableView!
    
    // hourLabels connection
    @IBOutlet weak var startHourLabel: UILabel!
    @IBOutlet weak var endHourLabel: UILabel!
    
    // UserDefaults
    var defaults = UserDefaults.standard
    var startHour : Date = Date()
    var endHour : Date = Date()
    
    
    override func viewDidLoad() {
        
        // tableView config
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // day hours config

        if let hour = DateHelper.timeStringToDate(string: startHourLabel.text!) {
        startHour = hour
        }
        
        if let hour = DateHelper.timeStringToDate(string: endHourLabel.text!) {
            endHour = hour
        }
        
        saveDayHours()
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
    
    
    // Changing label values
    
    func changeHourLabelValue(label: UILabel, value: Double) {

        let dateHour = Int(value)
        
        if (value > Double(dateHour)) {
            label.text = "\(dateHour):30"
        } else {
            label.text = "\(dateHour):00"
        }
        
    }
    
    // Saving hours to UserDefaults
    
    func saveDayHours() {
        
        defaults.set(startHour, forKey: "dayStart")
        defaults.set(endHour, forKey: "dayEnd")
        
    }
    
    // Loading hours from UserDefaults
    
    func loadDayHours() {
        
        startHour = defaults.value(forKey: "dayStart") as! Date
        endHour = defaults.value(forKey: "dayEnd") as! Date
        
    }
    
    
    let pageIndex: Int = 0
    
}

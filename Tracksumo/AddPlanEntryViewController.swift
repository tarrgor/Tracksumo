//
//  AddPlanEntryViewController.swift
//  Tracksumo
//
//  Created by Thorsten Klusemann on 20.12.16.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit

class AddPlanEntryViewController: UITableViewController {
  
  @IBOutlet weak var activityNameLbl: UILabel!
  @IBOutlet weak var activityCategoryLbl: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  var timeInMinutes: Int = 0
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ToSelectActivityScreen" {
      if let destVC = segue.destination as? SelectActivityTableViewController {
        destVC.onSelected = self.didSelectActivity
      }
    }
  }
  
  func didSelectActivity(activity: Activity) {
    activityNameLbl.text = activity.name
    activityCategoryLbl.text = activity.category
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    timeInMinutes = Int(sender.value)
    adjustTimeLabel()
  }
  
  func adjustTimeLabel() {
    let hours = timeInMinutes / 60
    let minutes = timeInMinutes % 60
    let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
    timeLabel.text = "\(hours):\(minutesStr)"
  }
  
  @IBAction func saveButtonPressed(_ sender: UIButton) {
  }
  
  @IBAction func cancelButtonPressed(_ sender: UIButton) {
  }
}

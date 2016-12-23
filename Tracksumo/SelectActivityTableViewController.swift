//
//  SelectActivityViewController.swift
//  Tracksumo
//
//  Created by Thorsten Klusemann on 20.12.16.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit

class SelectActivityTableViewController: UITableViewController {
  
  var activities: [Activity] = []
  var categories: [String] = []
  var activityMap: [String:[Activity]] = [:]
  
  var onSelected: ((Activity) -> ())?
  
  fileprivate var selectedActivity: Activity?
  
  override func viewDidLoad() {
    loadDummyData()
    convertData()
  }
  
  @IBAction func doneButtonPressed(sender: UIButton) {
    if let activity = self.selectedActivity {
      self.dismiss(animated: true, completion: {
        self.onSelected?(activity)
      })
    }
  }
  
  private func loadDummyData() {
    let a1 = Activity(entity: entity(name: "Activity")!, insertInto: persistentContainer.viewContext)
    a1.name = "Coding"
    a1.category = "Work"
    activities.append(a1)
    
    let a2 = Activity(entity: entity(name: "Activity")!, insertInto: persistentContainer.viewContext)
    a2.name = "Office"
    a2.category = "Work"
    activities.append(a2)
    
    let a3 = Activity(entity: entity(name: "Activity")!, insertInto: persistentContainer.viewContext)
    a3.name = "Watch TV"
    a3.category = "Time Wasting"
    activities.append(a3)
  }
  
  private func convertData() {
    activities.forEach { self.convertActivity(activity: $0) }
  }
  
  fileprivate func convertActivity(activity: Activity) {
    if !categories.contains(activity.category!) {
      categories.append(activity.category!)
    }
    if activityMap[activity.category!] != nil {
      activityMap[activity.category!]!.append(activity)
    } else {
      activityMap[activity.category!] = [activity]
    }
  }
}

extension SelectActivityTableViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return categories.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return activityMap[categories[section]]?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SelectActivityCell", for: indexPath) as! SelectActivityCell
    if let activity = activityMap[categories[indexPath.section]]?[indexPath.row] {
      cell.activity = activity
      cell.configure()
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let category = categories[section]
    let view = CategoryView(category: category)
    view.addHandler = {
      self.addActivity(section)
    }
    
    return view
  }

  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 44
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) as? SelectActivityCell {
      cell.accessoryType = .checkmark
      self.selectedActivity = cell.activity
    }
  }
  
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) as? SelectActivityCell {
      cell.accessoryType = .none
      self.selectedActivity = nil
    }
  }
  
  func addActivity(_ section: Int) {
    let alert = UIAlertController(title: "Add Activity", message: "Please enter the name of the activity.", preferredStyle: .alert)
    alert.addTextField { textField in
      
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
    }
    alert.addAction(cancelAction)
    let saveAction = UIAlertAction(title: "Save", style: .default) { action in
      if let name = alert.textFields?[0].text {
        let activity = Activity(entity: self.entity(name: "Activity")!, insertInto: self.persistentContainer.viewContext)
        activity.name = name
        activity.category = self.categories[section]
        self.insertNewActivity(activity, in: section)
      }
    }
    alert.addAction(saveAction)
    
    present(alert, animated: true, completion: nil)
  }

  func insertNewActivity(_ activity: Activity, in section: Int) {
    self.activities.append(activity)
    self.convertActivity(activity: activity)
    
    if let sectionActivitiyCount = self.activityMap[categories[section]]?.count {
      let indexPath = IndexPath(row: sectionActivitiyCount - 1, section: section)
      self.tableView.insertRows(at: [indexPath], with: .automatic)
    }
  }
}








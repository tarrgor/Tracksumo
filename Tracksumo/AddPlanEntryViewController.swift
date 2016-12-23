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
  
}

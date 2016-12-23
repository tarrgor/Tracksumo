//
//  SelectActivityCell.swift
//  Tracksumo
//
//  Created by Thorsten Klusemann on 20.12.16.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit

class SelectActivityCell: UITableViewCell {
  var activity: Activity?
  
  func configure() {
    if activity != nil {
      self.textLabel?.text = activity?.name
    }
  }
}

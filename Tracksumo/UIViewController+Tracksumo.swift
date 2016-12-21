//
//  UIViewController+Tracksumo.swift
//  Tracksumo
//
//  Created by Thorsten Klusemann on 21.12.16.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
  
  var persistentContainer: NSPersistentContainer {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer
  }
  
  func entity(name: String) -> NSEntityDescription? {
    return NSEntityDescription.entity(forEntityName: name, in: persistentContainer.viewContext)
  }
  
}

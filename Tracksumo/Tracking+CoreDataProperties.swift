//
//  Tracking+CoreDataProperties.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 20/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Tracking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tracking> {
        return NSFetchRequest<Tracking>(entityName: "Tracking");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var trackedTime: Int32
    @NSManaged public var activity: Activity?

}

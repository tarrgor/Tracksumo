//
//  PlanEntry+CoreDataProperties.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 20/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PlanEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlanEntry> {
        return NSFetchRequest<PlanEntry>(entityName: "PlanEntry");
    }

    @NSManaged public var plannedTime: Int32
    @NSManaged public var activity: Activity?
    @NSManaged public var plan: Plan?

}

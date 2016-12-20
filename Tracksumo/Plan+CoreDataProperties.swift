//
//  Plan+CoreDataProperties.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 20/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Plan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plan> {
        return NSFetchRequest<Plan>(entityName: "Plan");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var planEntries: NSOrderedSet?

}

// MARK: Generated accessors for planEntries
extension Plan {

    @objc(insertObject:inPlanEntriesAtIndex:)
    @NSManaged public func insertIntoPlanEntries(_ value: PlanEntry, at idx: Int)

    @objc(removeObjectFromPlanEntriesAtIndex:)
    @NSManaged public func removeFromPlanEntries(at idx: Int)

    @objc(insertPlanEntries:atIndexes:)
    @NSManaged public func insertIntoPlanEntries(_ values: [PlanEntry], at indexes: NSIndexSet)

    @objc(removePlanEntriesAtIndexes:)
    @NSManaged public func removeFromPlanEntries(at indexes: NSIndexSet)

    @objc(replaceObjectInPlanEntriesAtIndex:withObject:)
    @NSManaged public func replacePlanEntries(at idx: Int, with value: PlanEntry)

    @objc(replacePlanEntriesAtIndexes:withPlanEntries:)
    @NSManaged public func replacePlanEntries(at indexes: NSIndexSet, with values: [PlanEntry])

    @objc(addPlanEntriesObject:)
    @NSManaged public func addToPlanEntries(_ value: PlanEntry)

    @objc(removePlanEntriesObject:)
    @NSManaged public func removeFromPlanEntries(_ value: PlanEntry)

    @objc(addPlanEntries:)
    @NSManaged public func addToPlanEntries(_ values: NSOrderedSet)

    @objc(removePlanEntries:)
    @NSManaged public func removeFromPlanEntries(_ values: NSOrderedSet)

}

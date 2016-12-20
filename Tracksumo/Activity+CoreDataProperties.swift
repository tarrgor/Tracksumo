//
//  Activity+CoreDataProperties.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 20/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity");
    }

    @NSManaged public var name: String?
    @NSManaged public var category: String?
    @NSManaged public var planEntries: NSSet?
    @NSManaged public var trackings: NSSet?

}

// MARK: Generated accessors for planEntries
extension Activity {

    @objc(addPlanEntriesObject:)
    @NSManaged public func addToPlanEntries(_ value: PlanEntry)

    @objc(removePlanEntriesObject:)
    @NSManaged public func removeFromPlanEntries(_ value: PlanEntry)

    @objc(addPlanEntries:)
    @NSManaged public func addToPlanEntries(_ values: NSSet)

    @objc(removePlanEntries:)
    @NSManaged public func removeFromPlanEntries(_ values: NSSet)

}

// MARK: Generated accessors for trackings
extension Activity {

    @objc(addTrackingsObject:)
    @NSManaged public func addToTrackings(_ value: Tracking)

    @objc(removeTrackingsObject:)
    @NSManaged public func removeFromTrackings(_ value: Tracking)

    @objc(addTrackings:)
    @NSManaged public func addToTrackings(_ values: NSSet)

    @objc(removeTrackings:)
    @NSManaged public func removeFromTrackings(_ values: NSSet)

}

//
//  RouteEntity+CoreDataProperties.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 28.09.2022.
//
//

import Foundation
import CoreData


extension RouteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RouteEntity> {
        return NSFetchRequest<RouteEntity>(entityName: "RouteEntity")
    }

    @NSManaged public var dates: Date?
    @NSManaged public var nameRoute: String?
    @NSManaged public var task: NSOrderedSet?

}

// MARK: Generated accessors for task
extension RouteEntity {

    @objc(insertObject:inTaskAtIndex:)
    @NSManaged public func insertIntoTask(_ value: Tasks, at idx: Int)

    @objc(removeObjectFromTaskAtIndex:)
    @NSManaged public func removeFromTask(at idx: Int)

    @objc(insertTask:atIndexes:)
    @NSManaged public func insertIntoTask(_ values: [Tasks], at indexes: NSIndexSet)

    @objc(removeTaskAtIndexes:)
    @NSManaged public func removeFromTask(at indexes: NSIndexSet)

    @objc(replaceObjectInTaskAtIndex:withObject:)
    @NSManaged public func replaceTask(at idx: Int, with value: Tasks)

    @objc(replaceTaskAtIndexes:withTask:)
    @NSManaged public func replaceTask(at indexes: NSIndexSet, with values: [Tasks])

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Tasks)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Tasks)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSOrderedSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSOrderedSet)

}

extension RouteEntity : Identifiable {

}

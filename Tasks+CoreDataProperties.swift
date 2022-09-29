//
//  Tasks+CoreDataProperties.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 28.09.2022.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var task: String?
    @NSManaged public var route: RouteEntity?

}

extension Tasks : Identifiable {

}

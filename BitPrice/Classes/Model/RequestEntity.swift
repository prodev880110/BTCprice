//
//  RequestEntity.swift
//  
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//
//

import Foundation
import CoreData

@objc(RequestEntity)
public class RequestEntity: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RequestEntity> {
        return NSFetchRequest<RequestEntity>(entityName: "RequestEntity")
    }
    
    @NSManaged public var date: NSDate
    @NSManaged public var responseBody: String
    @NSManaged public var url: String
    
}

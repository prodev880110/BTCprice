//
//  RequestDbService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import CoreData
import Foundation

class RequestDbService {

    // MARK: - Public
    
    func insert(url: String, data: Data, date: Date) {
        delete(url: url)
        
        let stack = CoreDataStack.shared
        let context = stack.context
        _ = RequestEntity(url: url, data: data, date: date)
        
        do {
            try context.save()
            stack.saveContext()
        } catch let error {
            debugPrint("error: \(error)")
        }
    }
    
    func fetch(url: String) -> RequestEntity? {
        let context = CoreDataStack.shared.context
        var request: RequestEntity?
        
        let fetchRequest: NSFetchRequest<RequestEntity> = RequestEntity.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "url = %@", url)

        do {
            request = try context.fetch(fetchRequest).first as RequestEntity?
        } catch let error {
            debugPrint("error: \(error)")
        }
        
        return request
    }
    
    func fetch() -> [RequestEntity]? {
        let context = CoreDataStack.shared.context
        let fetchRequest: NSFetchRequest<RequestEntity> = RequestEntity.fetchRequest()
        var requests: [RequestEntity]?
        
        do {
            requests = try context.fetch(fetchRequest) as [RequestEntity]?
        } catch let error {
            debugPrint("error: \(error)")
        }
        
        return requests
    }
    
    func delete(url: String) {
        let stack = CoreDataStack.shared
        let context = stack.context
        let request = fetch(url: url)
        
        if let request = request {
            context.delete(request)
            stack.saveContext()
        }
    }
    
    func delete() {
        let stack = CoreDataStack.shared
        let context = stack.context
        let requests = fetch()
        
        if let requests = requests {
            for request in requests {
                context.delete(request)
            }
            stack.saveContext()
        }
    }

}

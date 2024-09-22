//
//  CoreDataStack.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/22/24.
//
import CoreData

class CoreDataController {
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DatabaseModel")

        container.loadPersistentStores { _, error in
            if let error {
                fatalError(
                    "Failed to load persistent stores: \(error.localizedDescription)"
                )
            }
        }
        return container
    }() 
}

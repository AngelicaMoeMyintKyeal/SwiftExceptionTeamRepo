//
//  PersistenceController.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 24/01/23.
//

import CoreData
import Foundation

struct PersistenceManager {
    
    static let shared = PersistenceManager()
    
    static var preview: PersistenceManager = {
        let result = PersistenceManager(inMemory: true)
        let viewContext = result.container.viewContext
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "WordDatabase")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
}

//class PersistenceController: ObservableObject {
//    let container = NSPersistentContainer(name: "WordDatabase") // Only connect to the DB (prepare)
//
//    static var shared = PersistenceController()
//
//    static var sharedMock = PersistenceController(isInMemory: true)
//
//    // Try to load the data from the disk
//    private init(isInMemory: Bool = false) {
//        if isInMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//
//        container.loadPersistentStores { description, error in
//            if let error {
//                print("Core Data fail to load, error: \(error.localizedDescription)")
//                return
//            }
//
//            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
//        }
//    }
//
//    func saveContext() {
//        if container.
//    }
//}

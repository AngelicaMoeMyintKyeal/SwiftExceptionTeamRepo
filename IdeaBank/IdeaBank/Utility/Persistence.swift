//
//  PersistenceController.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 24/01/23.
//

import CoreData
import Foundation

class PersistenceController: ObservableObject {
    let container = NSPersistentContainer(name: "WordDatabase") // Only connect to the DB (prepare)
    
    static var shared = PersistenceController()
    
    static var sharedMock = PersistenceController(isInMemory: true)
    
    // Try to load the data from the disk
    private init(isInMemory: Bool = false) {
        if isInMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error {
                print("Core Data fail to load, error: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}

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
        let viewContext = result.persistenceContainer.viewContext
        return result
    }()
    
    let persistenceContainer: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        persistenceContainer = NSPersistentContainer(name: "WordDatabase")
        if inMemory {
            persistenceContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        persistenceContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistenceContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func createRandomWord(resultWord: String, resultMeanings: String) {
        print("IS CALLING")
        let managedContext = PersistenceManager.shared.persistenceContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "RandomWord", in: managedContext)!
        
        let storedWord = NSManagedObject(entity: entity, insertInto: managedContext)
        storedWord.setValue(resultWord, forKey: "word")
        storedWord.setValue(resultMeanings, forKey: "definition")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func findRandomWord(findWord: String) -> RandomWord? {
        let managedContext = PersistenceManager.shared.persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "RandomWord")
        fetchRequest.predicate = NSPredicate(format: "word ==%@", findWord)
        do {
            let response = try managedContext.fetch(fetchRequest)
            return response.isEmpty ? nil : response[0] as? RandomWord
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.localizedDescription)")
            return nil
        }
    }
    
    func saveContext() {
        
        let context: NSManagedObjectContext = persistenceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unsolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

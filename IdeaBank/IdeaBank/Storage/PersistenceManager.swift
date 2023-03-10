//
//  PersistenceManager.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 24/01/23.
//

/*
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
        persistenceContainer = NSPersistentContainer(name: "IdeaDatabase")
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
    
    func storeFinalIdea(finalIdea: String) {
        let managedContext = PersistenceManager.shared.persistenceContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "StoredIdea", in: managedContext)!
        
        let storedIdea = NSManagedObject(entity: entity, insertInto: managedContext)
        storedIdea.setValue(finalIdea, forKey: "idea")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchFinalIdeaAll() -> StoredIdea? {
        let managedContext = PersistenceManager.shared.persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoredIdea")
        do {
            let response = try managedContext.fetch(fetchRequest)
            return response.isEmpty ? nil : response[0] as? StoredIdea
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func deleteSingleIdea(with id: UUID?) {
        let managedContext = PersistenceManager.shared.persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoredIdea")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "id", id! as any CVarArg )
        do {
            let ideas = try managedContext.fetch(fetchRequest)
            for idea in ideas {
                managedContext.delete(idea)
                try managedContext.save()
            }
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
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
*/

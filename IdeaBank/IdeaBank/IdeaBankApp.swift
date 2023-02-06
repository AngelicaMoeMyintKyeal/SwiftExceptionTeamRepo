//
//  IdeaBankApp.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

@main
struct IdeaBankApp: App {
    let persistenceManager = PersistenceManager.shared
    @StateObject var VM = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            PhaseZeroMainView()
                .environmentObject(VM)
                .environment(\.managedObjectContext,persistenceManager.persistenceManager.viewContext)
            /* Old code that uses the WebService kept for learning purposes
            ContentView()
                .environmentObject(VM)
                .task {
                    for wordInPool in Word.pool.shuffled().prefix(10) {
                        do {
                            let newWord = try await WebService.fetchDefinition(for: wordInPool)
                            print("Fetched Word: \(newWord.word) | Definition: \(newWord.definition)")
                            VM.words.append(newWord)
                        } catch {
                            if let error = error as? NetworkError {
                                switch error {
                                case .badUrl:
                                    print("Error with the url")
                                case .invalidRequest:
                                    print("Error with the request")
                                }
                            } else {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
             */
        }
    }
}

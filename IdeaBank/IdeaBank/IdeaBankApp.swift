//
//  IdeaBankApp.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

@main
struct IdeaBankApp: App {
    @StateObject private var persisenceManager = PersisenceManager.shared
    @StateObject var VM = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VM)
                .task {
                    for wordInPool in wordPool.shuffled() {
                        do {
                            let newWord = try await WebService.fetchDefinition(for: wordInPool)
                            debugPrint("Fetched Word: \(newWord.word) | Definition: \(newWord.definition)")
                            VM.words.append(newWord)
                        } catch {
                            if let error = error as? NetworkError {
                                switch error {
                                case .badUrl:
                                    debugPrint("Error with the url")
                                case .invalidRequest:
                                    debugPrint("Error with the request")
                                }
                            } else {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
        }
    }
}

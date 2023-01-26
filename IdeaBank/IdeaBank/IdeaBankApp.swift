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
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environment(\.managedObjectContext, persistenceManager.persistenceContainer.viewContext)
        }
    }
}

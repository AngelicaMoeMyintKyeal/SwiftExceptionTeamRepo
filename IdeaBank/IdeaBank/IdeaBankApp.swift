//
//  IdeaBankApp.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI
import CoreData

@main
struct IdeaBankApp: App {
//    let persistenceManager = PersistenceManager.shared
    @StateObject var viewModel = ViewModel()
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            PhaseZeroMainView()
                .environmentObject(viewModel)
                .environment(\.managedObjectContext, dataController.container.viewContext)
//                .environment(\.managedObjectContext,persistenceManager.persistenceContainer.viewContext)
        }
    }
}

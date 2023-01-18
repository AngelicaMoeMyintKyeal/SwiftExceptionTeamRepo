//
//  IdeaBankApp.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

@main
struct IdeaBankApp: App {
    @StateObject var viewModel: ViewModel = ViewModel()
    @StateObject var wordDefinitionManager = WordDefinitionSearchManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(wordDefinitionManager)
        }
    }
}

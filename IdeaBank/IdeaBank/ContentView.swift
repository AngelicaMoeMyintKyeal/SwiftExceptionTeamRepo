//
//  ContentView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    @EnvironmentObject var wordDefManager: WordDefinitionSearchManager
    
    @State private var isShowingPhaseTwo: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                if vm.selectedWords.count < 10 {
                    PhaseOneMainView()
                } else {
                    PhaseTwoMainView()
                }
            }
        }
        .onAppear {
            wordDefManager.fetchDefinition(randomWord: "apple")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
//            .environmentObject(WordDefinitionSearchManager())
    }
}

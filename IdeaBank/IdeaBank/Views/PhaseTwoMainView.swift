//
//  PhaseTwoMainView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 11/01/23.
//

import SwiftUI

struct PhaseTwoMainView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                LinearGradient(colors: [.black, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    PhaseInformView(phaseHeader: "PHASE 2", phaseTitle: "Compose", phaseDescription: "Out of the 20 words you choose, what do these 3 make you think about?")
                    
                    Spacer()
                    
                    VStack {
                        var shuffledSelectedWords = vm.selectedWords.shuffled()
        
                        ForEach(0..<3, id:\.self) { index in
                            CompactWordView(title: shuffledSelectedWords[index].word)
                        }
                    }
                    .padding(.horizontal)
                    
                                
                    Spacer()
                    Divider()
  
                    TextField("Enter your app idea", text: $textFieldText)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next Phase") {
                        // next phase action
                    }
                }
            }
        }
    }
}

struct PhaseTwoMainView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseTwoMainView()
            .environmentObject(ViewModel())
    }
}

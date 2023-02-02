//
//  PhaseOneMainView.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

struct PhaseOneMainView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {

        ZStack {
            
            Color.background.ignoresSafeArea()
            
            VStack {
                Spacer()
                Header(
                    title: "Choose",
                    description: "Swipe right to save a word if you like it or it inspires you, swipe right to discard"
                )
                Spacer()
                GridView()
                Spacer()
                ZStack {
                    if let words = vm.displayingWords {
                        if words.isEmpty {
                            Text("Nothing to display right now. Come back later...")
                                .font(.caption)
                                .foregroundColor(.primary)
                        } else {
                            // Displaying cards
                            // Cards are reversed because it's a ZStack
                            // so you can use .reversed() on the forEach
                            ForEach(words.reversed()) { word in
                                StackCardView(word: word)
                                    .frame(width: 320, height: 300)
                            }

                        }
                    } else {
                        ProgressView()
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        print(vm.selectedWords)
                        vm.selectedWords = []
                        print(vm.selectedWords)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                
                ToolbarItem {
                    NavigationLink("Next", destination: PhaseTwoMainView())
                    .disabled(vm.selectedWords.count < 10)
                }
                
            }
            
        }
        
        
    }
}

struct PhaseOneMainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}

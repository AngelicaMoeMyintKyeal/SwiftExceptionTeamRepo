//
//  PhaseOneMainView.swift
//  IdeaBank
//
//  Created by シェイミ on 16/01/2023.
//

import SwiftUI

struct PhaseOneMainView: View {
    @EnvironmentObject var VM: ViewModel
    
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
                    if let words = VM.displayingWords {
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
                                    .shadow(color: .black.opacity(0.4),radius: 3, x: 2)
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
                        print(VM.selectedWords)
                        VM.selectedWords = []
                        print(VM.selectedWords)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                ToolbarItem {
                    NavigationLink("Next", destination: PhaseTwoMainView())
                    .disabled(VM.selectedWords.count < 10)
                }
            }
        }
    }
}

struct PhaseOneMainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            PhaseOneMainView()
                .environmentObject(ViewModel())
        }
    }
}

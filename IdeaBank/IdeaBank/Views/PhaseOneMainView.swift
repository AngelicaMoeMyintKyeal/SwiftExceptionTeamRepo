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
        VStack {
            Spacer()
            PhaseInformView(
                phaseHeader: "Phase 1",
                phaseTitle: "Choose",
                phaseDescription: "Swipe right to save a word if you like it or it inspires you, swipe right to discard it"
            )
            Spacer()
            GridView()
            Spacer()
            ZStack {
                if let words = vm.displayingWords {
                    if words.isEmpty {
                        Text("Nothing to display right now. Come back later...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    } else {
                        // Displaying cards
                        // Cards are reversed because it's a ZStack
                        // so you can use .reversed() on the forEach
                        ForEach(words.reversed()) { word in
                            // Card view
                            StackCardView(word: word)
                                .frame(width: 320, height: 300)
                        }
                    }
                } else {
                    ProgressView()
                }
            }
        }
    }
}

struct PhaseOneMainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            PhaseOneMainView()
                .environmentObject(ViewModel())
        }
    }
}

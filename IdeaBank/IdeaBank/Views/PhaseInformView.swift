//
//  PhaseInformView.swift
//  IdeaBank
//
//  Created by Andrea Copellino on 12/01/23.
//

import SwiftUI

struct PhaseInformView: View {
    
    var phaseHeader: String
    var phaseTitle: String
    var phaseDescription: String
    
    var body: some View {
        VStack {
            Text(phaseHeader.uppercased())
                
                .foregroundStyle(.thinMaterial)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.black)
                .opacity(0.5)

            Text(phaseTitle)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            Text(phaseDescription)
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
        .padding(.horizontal, 32.0)
        
    }
}

struct PhaseInformView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseInformView(phaseHeader: "phase 1", phaseTitle: "Choose", phaseDescription: "Swipe right to save a word if you like it or it inspires you, swipe right to discard it")
    }
}


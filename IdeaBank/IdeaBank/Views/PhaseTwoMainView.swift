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
                    
                    GridView()
                                
                    Spacer()
                    Divider()
  
                    TextField("Enter your app idea", text: $textFieldText)
                    Spacer()
                }
            }
            
//            VStack {
//                Text("PHASE 2")
//                    .font(.subheadline)
//                    .fontDesign(Font.Design.default)
//                    .bold()
//                    .foregroundColor(Color.gray)
//                Text("Compose")
//                    .font(.largeTitle)
//                    .fontDesign(Font.Design.default)
//                    .bold()
//                    .foregroundColor(Color.black)
//                Text("Out of the 20 words you choose, what do these 3 make you think about?")
//                    .font(.footnote)
//                    .fontDesign(Font.Design.default)
//                    .multilineTextAlignment(.center)
//                    .padding()
//            }
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

//
//  TextFieldView.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 13/01/23.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var ideaText: String = ""
    var body: some View {
        Form {
            TextEditor(text: $ideaText)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

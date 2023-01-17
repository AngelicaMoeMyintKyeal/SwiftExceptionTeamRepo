//
//  WordDefinitionSearchManager.swift
//  IdeaBank
//
//  Created by Htet Myat Moe Myint Kyeal on 17/01/23.
//

import Foundation

class WordDefinitionSearchManager: ObservableObject {
    
    @Published var words: [Words] = []
    
    func fetchDefinition(randomWord: String) {

        guard let wordDefURL = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(randomWord)") else {fatalError("Missing URL")}

        /// for testing temporarily
//        guard let wordDefURL = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\happy") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: wordDefURL)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if let error = error {
                print("Request Error:", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {return}
            
            if response.statusCode == 200 {
                guard let data = data  else {return}
                DispatchQueue.main.async {
                    do {
                        let decodedWords = try JSONDecoder().decode([Words].self, from: data)
                        self.words = decodedWords
                    } catch let error {
                        print("Error Decoding:", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}

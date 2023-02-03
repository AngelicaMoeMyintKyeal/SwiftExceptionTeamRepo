//
//  WebService.swift
//  IdeaBank
//
//  Created by Pierpaolo Siciliano on 31/01/23.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
}

struct WebService {
    private init() { }
    
    static func fetchDefinition(for word: String) async throws -> Word {
        // The URL can be placed in a configuration so it can be changed between dev/test/prod
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidRequest
        }
        
        let definitions = try JSONDecoder().decode([WordResponse].self, from: data)
        return Word(
            word: word,
            definition: definitions.first!.meanings.first!.definitions.first!.definition
        )
    }
}

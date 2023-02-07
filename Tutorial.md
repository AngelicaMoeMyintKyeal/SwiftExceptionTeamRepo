## API Tutorial

In week 2 we were tasked with integrating an API into IdeaBank. 
We originally selected an API that returned words at random. However we found that the words returned were often not useful, and most of the time it would just return place names from around the world that would have no meaning. 

So after searching a bit more we came across [DictionaryAPI](https://dictionaryapi.dev). This API took one word and returned the definitions for that word. So we decided to integrate this into the word cards, where it would show a word and then the definition below. 

We created an asynchronous fetchDefinition() function that accepts a word as a String. The word is then appended to the URL in order to send it to the API. As it is an async function, we mark is with @MainActor:

```
@MainActor
 func fetchDefinition(randomWord: String) async {
	 guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(randomWord)") else {
		 return
	 }
	 ....
 }
 ```
 
 However, we decided to amend our array of Strings to a Word struct in order to match the JSON data returned from the API call. It was awkward because it returned several Words structs with the same word but different meanings. (We solved this by basically only accepting the first returned word, as shown in the do block of fetchDefinition() function below).
 
 
 
 ```
struct Word: Codable, Identifiable {
	 var id = UUID().uuidString
	 let word: String
	 let meanings: [Meaning]?
	 
	 enum CodingKeys: String, CodingKey {
		 case word = "word"
		 case meanings = "meanings"
	 }
 }
 
 struct Meaning: Codable {
	 let definitions: [Definition]
 }
 
 struct Definition: Codable {
	 let definition: String
 }
 ```
 
 
 
 
 So we stored the list of words in an array of Word with optional meanings, and called a forEach in the init() of the viewModel in order to get the definitions. We used Task, as it is an async function: 
 
 ```
    init() {
        Task {
            for word in wordPool {
            	await fetchDefinition(randomWord: word.word)
           }
      }
   }
  ```
  
  The rest of our fetchDefinition() function was fairly basic: 
    
  ```
  @MainActor
   func fetchDefinition(randomWord: String) async {
	   ....
  
	   do {
		   let (data, _) = try await URLSession.shared.data(from: url)
		   let decodedWords = try JSONDecoder().decode([Word].self, from: data)
		   if decodedWords.count == 1 {
			   self.words.append(contentsOf: decodedWords)
		   } else {
			   let firstWord = decodedWords[0]
			   words.append(firstWord)
		   }
		   print("API Called")
	   } catch {
		   print("Catch block!")
		   if words.isEmpty {
			   for word in wordPool {
				   words.append(word)
			   }
		   }
		   print(error.localizedDescription)
	   }
   }
   ```
   
   

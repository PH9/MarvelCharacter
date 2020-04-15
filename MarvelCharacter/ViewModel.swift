import Foundation

class ViewModel {

  private(set) var lastResponse: [Character] = []

  func getCharacters(name: String, completionHandler completion: @escaping (Result<[Character], MarvelError>) -> Void) {
    let key = "apikey=b5c6cdc04250b4541d07403317c93445&ts=2010&hash=5b131b2233c0103b25ea4d17a46a1044"
    let endpoint = "https://gateway.marvel.com/v1/public/characters?nameStartsWith=\(name)&\(key)"
    guard let url = URL(string: endpoint) else {
      fatalError("Could not create URL with \(endpoint)")
    }

    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
      if let error = error {
        let error = MarvelError(message: error.localizedDescription)
        completion(.failure(error))
        return
      }

      guard let data = data else {
        let error = MarvelError(message: "Data is nil")
        completion(.failure(error))
        return
      }

      do {
        let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
        self.lastResponse = response.data.results
        completion(.success(response.data.results))
      } catch {
        let error = MarvelError(message: error.localizedDescription)
        completion(.failure(error))
      }
    }

    task.resume()
  }

}

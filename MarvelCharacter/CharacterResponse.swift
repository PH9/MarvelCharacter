import Foundation

struct CharacterResponse: Decodable {

  let data: CharacterData
}

struct CharacterData: Decodable {

  let results: [Character]
}

struct Character: Decodable {

  let name: String
  let thumbnail: CharacterThumbnail

  var thumbnailURL: URL {
    return URL(string: "\(thumbnail.path)\(thumbnail.extension)")!
  }
}

struct CharacterThumbnail: Decodable {

  let path: String
  let `extension`: String
}

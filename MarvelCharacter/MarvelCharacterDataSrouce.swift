import UIKit

class MarvelCharacterDataSource: NSObject, UITableViewDataSource {

  private var values: [[Character]] = [[]]

  enum Section: Int {
    case name
  }

  func load(_ characters: [Character]) {
    values.removeAll()
    values = [[]]
    values[Section.name.rawValue] = characters
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    values[section].count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: CharacterNameCell.reuseIdentifier, for: indexPath) as? CharacterNameCell else {
        fatalError("Could not dequeue \(CharacterNameCell.reuseIdentifier)")
    }

    let name = values[indexPath.section][indexPath.row].name

    cell.configureWith(name)

    return cell
  }

}

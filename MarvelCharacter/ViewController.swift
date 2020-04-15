import UIKit

class ViewController: UITableViewController {

  @IBOutlet weak var searchByNameTextField: UITextField!

  let dataSource = MarvelCharacterDataSource()
  let viewModel = ViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = dataSource
  }

  @IBAction func search(_ sender: Any) {
    let name = searchByNameTextField.text!

    viewModel.getCharacters(name: name) { result in
      switch result {
      case .success(let characters):
        self.dataSource.load(characters)
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      case .failure(let error):
        print(error)
      }
    }
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let character = viewModel.lastResponse[indexPath.row]
    let vc = CharacterProfileViewController.configureWith(character)
    navigationController?.pushViewController(vc, animated: true)
  }

}

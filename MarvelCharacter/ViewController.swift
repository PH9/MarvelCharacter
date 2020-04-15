import UIKit

class ViewController: UITableViewController {

  let dataSource = MarvelCharacterDataSource()
  let viewModel = ViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = dataSource

    viewModel.getCharacters { result in
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

}

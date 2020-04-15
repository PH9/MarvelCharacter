import UIKit

class CharacterNameCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    static var reuseIdentifier: String {
        String(describing: self)
    }

    func configureWith(_ name: String) {
        nameLabel.text = name
    }
}

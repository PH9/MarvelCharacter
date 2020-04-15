import UIKit
import Kingfisher

class CharacterProfileViewController: UIViewController {

  @IBOutlet weak var thumnailImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  static var identifier: String {
    String(describing: self)
  }

  static func instantiate() -> CharacterProfileViewController {
    let storyboardName = "CharacterProfile"
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    guard let vc = storyboard.instantiateViewController(
      identifier: CharacterProfileViewController.identifier) as? CharacterProfileViewController else {
        fatalError("Could not instantiate with identifier: \(CharacterProfileViewController.identifier) from \(storyboardName)")
    }

    return vc
  }

  static func configureWith(_ character: Character) -> CharacterProfileViewController {
    let vc = instantiate()
    _ = vc.view

    debugPrint(character.thumbnailURL)
    vc.thumnailImageView.kf.setImage(with: character.thumbnailURL)
    vc.nameLabel.text = character.name
    vc.descriptionLabel.text = character.description

    return vc
  }
}

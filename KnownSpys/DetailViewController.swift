import UIKit

class DetailViewController: UIViewController, SecretDetailsDelegate {
  
  
  @IBOutlet var profileImage: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var ageLabel: UILabel!
  @IBOutlet var genderLabel: UILabel!
  
  fileprivate var presenter: DetailPresenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func configure(with presenter: DetailPresenter) {
    self.presenter = presenter
  }
  
  func setupView() {
    profileImage.image = UIImage(named: presenter.imageName)
    nameLabel.text = presenter.name
    ageLabel.text  = presenter.age
    genderLabel.text = presenter.gender
  }
}

//MARK: - Touch Events
extension DetailViewController {
  @IBAction func briefcaseTapped(_ button: UIButton) {
    let secretDetailsPresenter = SecretDetailsPresenter(with: presenter.spy)
    let vc = SecretDetailsViewController(with: secretDetailsPresenter, and: self as SecretDetailsDelegate)
    
    navigationController?.pushViewController(vc, animated: true)
  }
}

//MARK: - SecretDetailsDelegate
extension DetailViewController {
  func passwordCrackingFinished() {
    //close middle layer too
    navigationController?.popViewController(animated: true)
  }
}

//MARK: - Helper Methods
extension DetailViewController {
  static func fromStoryboard(with presenter: DetailPresenter) -> DetailViewController {
    let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    vc.configure(with: presenter)
    
    return vc
  }
}


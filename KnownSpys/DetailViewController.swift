import UIKit

class DetailViewController: UIViewController {
  
  
  @IBOutlet var profileImage: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var ageLabel: UILabel!
  @IBOutlet var genderLabel: UILabel!
  
  fileprivate var presenter: DetailPresenter!
  fileprivate weak var navigationCoordinator: NavigationCoordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if isMovingToParentViewController {
      navigationCoordinator?.movingBack()
    }
  }

  
  func configure(with presenter: DetailPresenter,
                 navigationCoordinator: NavigationCoordinator ) {
    self.presenter = presenter
    self.navigationCoordinator = navigationCoordinator
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
    
    let args = ["spy": presenter.spy]
    
    navigationCoordinator?.next(arguments: args)
  }
}

////MARK: - SecretDetailsDelegate
//extension DetailViewController {
//  func passwordCrackingFinished() {
//    //close middle layer too
//    navigationController?.popViewController(animated: true)
//  }
//}
//
////MARK: - Helper Methods
//extension DetailViewController {
//  static func fromStoryboard(with presenter: DetailPresenter) -> DetailViewController {
//    let vc = UIStoryboard.main.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//    vc.configure(with: presenter)
//    
//    return vc
//  }
//}


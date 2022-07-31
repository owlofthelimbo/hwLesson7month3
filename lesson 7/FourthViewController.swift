import UIKit
class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Likes"
        tabBarItem.image = UIImage(systemName: "heart")
        setNavBarColor()
    }
}

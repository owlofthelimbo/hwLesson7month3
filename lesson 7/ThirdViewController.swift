import UIKit
class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Camera"
        tabBarItem.image = UIImage(systemName: "camera")
        setNavBarColor()
    }
}

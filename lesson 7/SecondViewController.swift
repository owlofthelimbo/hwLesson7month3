import UIKit
class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "Home"
        tabBarItem.image = tabBarItem.image?.withRenderingMode(.alwaysOriginal)
        setNavBarColor()
    }

}



//
//  ViewController.swift
//  lesson 7
//
//  Created by Александр Калашников on 28/7/22.
//

import UIKit

class ViewController: UITabBarController {
    
    var items: [UITabBarItem]? = nil
    
    private lazy var middleButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "plus")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingViewControllers()
    }

    func settingViewControllers() {
        
        tabBar.addSubview(middleButton)
        middleButton.addSubview(heartImageView)
        heartImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        heartImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor, constant: 0).isActive = true
        heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor, constant: 0).isActive = true
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor, constant: 0).isActive = true
        middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -35).isActive = true
        middleButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        middleButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        middleButton.layer.cornerRadius = 70/2
        middleButton.backgroundColor = .systemGreen
        
        let titles = ["Home", "Popular", "Camera", "Likes", "Profile"]
        let icons = ["house", "heart", "plus", "mail", "person.circle"]
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
    
        vc1.tabBarItem.image = UIImage(systemName: icons[0])
        vc2.tabBarItem.image = UIImage(systemName: icons[1])
        vc4.tabBarItem.image = UIImage(systemName: icons[3])
        vc5.tabBarItem.image = UIImage(systemName: icons[4])
        
        let controllers = [vc1, vc2, vc3, vc4, vc5]
            
        for i in 0..<controllers.count {
            controllers[i].title = titles[i]
        }
           
            
        setViewControllers(controllers, animated: false)
            
        tabBar.backgroundColor = .white
        items = tabBar.items
            
    }
}


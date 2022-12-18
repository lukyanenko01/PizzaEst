//
//  MainTabBarController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let middleButtonDiameter: CGFloat = 42
    private let redColor: UIColor = UIColor(red: 254.0 / 255.0, green: 116.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
    private let greenColor: UIColor = UIColor(red: 102.0 / 255.0, green: 166.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.layer.cornerRadius = middleButtonDiameter / 2
        middleButton.backgroundColor = redColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        return middleButton
    }()
    private lazy var menuImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "menucard.fill")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
    }
    
    @objc func didPressMiddleButton() {
        selectedIndex = 2
        middleButton.backgroundColor = greenColor
    }
    
    private func setTabBar() {
        viewControllers = [
            configureNavigationBar(HomeViewController(), title: "Акції", image: UIImage(systemName: "giftcard.fill")),
            configureNavigationBar(UIViewController(), title: "Локація", image: UIImage(systemName: "mappin.and.ellipse")),
            configureNavigationBar(MenuViewController(), title: "Меню", image: nil),
            configureNavigationBar(CartViewController(), title: "Корзина", image: UIImage(systemName: "cart.fill")),
            configureNavigationBar(ContactsViewController(), title: "Контакти", image: UIImage(systemName: "teletype"))
        ]
        
        tabBar.addSubview(middleButton)
        middleButton.addSubview(menuImageView)
        NSLayoutConstraint.activate([
            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            menuImageView.heightAnchor.constraint(equalToConstant: 15),
            menuImageView.widthAnchor.constraint(equalToConstant: 18),
            menuImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            menuImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
    }
    
    private func configureNavigationBar(_ rootVC: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        let imageView = UIImageView(image: #imageLiteral(resourceName: "titleNavVc"))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.contentMode = .scaleAspectFit
        navigationVC.tabBarItem.title = title
        if image != nil {
            navigationVC.tabBarItem.image = image
        }
        return navigationVC
    }
}
extension MainTabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item) // 1
        if selectedIndex != 2 { // 2
            middleButton.backgroundColor = redColor // 3
        } else {
            middleButton.backgroundColor = greenColor // 4
        }
    }
}

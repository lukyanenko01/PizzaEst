//
//  MainTabBarController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        setTabBar()
        UITabBar.appearance().barTintColor = .clear
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    private func setTabBar() {
        viewControllers = [
            configureNavigationBar(HomeViewController(), title: "Головна", image: #imageLiteral(resourceName: "homeTabBar")),
            configureNavigationBar(MenuViewController(), title: "Меню", image: #imageLiteral(resourceName: "menuTabBar")),
            configureNavigationBar(CartViewController(), title: "Корзина", image: #imageLiteral(resourceName: "cartTabBar")),
            configureNavigationBar(ContactsViewController(), title: "Контакти", image: #imageLiteral(resourceName: "contactsTabBar")),
        ]
    }
    
    private func configureNavigationBar(_ rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    

    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let x: CGFloat = {
            if view.frame.height <= 670 {
                return positionOnY - 40
            } else {
                return positionOnY
            }
        }()
        
        let y: CGFloat = {
            if view.frame.height <= 670 {
                return width + 70
            } else {
                return width
            }
        }()
        
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: x,
                                                          y: tabBar.bounds.minY - positionOnY,
                                                          width: y,
                                                          height: height),
                                      cornerRadius: height / 2)
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .fill
        
        roundLayer.fillColor = #colorLiteral(red: 0.168045789, green: 0.1881615222, blue: 0.1966018081, alpha: 0.7799361273)
        tabBar.tintColor = #colorLiteral(red: 0.8922456503, green: 0.1587543488, blue: 0.2403913736, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.8649099994)
    }
}


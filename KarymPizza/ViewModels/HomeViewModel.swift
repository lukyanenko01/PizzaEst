//
//  HomeViewModel.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import UIKit

class HomeViewModel {
    func setupNavigationBar(navigationItem: UINavigationItem,
                            navVc: UINavigationController?,
                            image: UIImage) {
        let titleImage = UIImageView()
        titleImage.image = image
        titleImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        titleImage.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImage
        navVc?.view.backgroundColor = .clear
        navVc?.navigationBar.isTranslucent = true
        navVc?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navVc?.navigationBar.shadowImage = UIImage()
    }
}

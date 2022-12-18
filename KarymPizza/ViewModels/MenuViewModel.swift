//
//  MenuViewModel.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

final class MenuViewModel {
    
    var products: Dynamic<[Product]> = Dynamic([])
    
    //MARK: - SearchController
    var filteredProducts: Dynamic<[Product]> = Dynamic([])
    
    var productsfiler = Product(id: "", title: "", imageUrl: "", priceS: 0, priceM: 0, priceXl: 0, descript: "")
    
    //Cell For Item At IndexPath
    func filterForItemCell(isFiltering: Bool, index: Int) -> Product {
        if let products1 = products.value {
            if isFiltering {
                if let pizza = filteredProducts.value {
                    productsfiler = pizza[index]
                }
            } else {
                productsfiler = products1[index]
            }
        }
        return productsfiler
    }
    
    //Count Cell
    func countCell(isFiltering: Bool) -> Int {
        var count = 0
        if isFiltering {
            count = filteredProducts.value?.count ?? 0
        } else {
            count = products.value?.count ?? 0
        }
        return count
    }
    
    //Didselect Item
    func didselectFiltrItem(isFiltering: Bool, index: Int) -> Product {
        if isFiltering {
            if let filter = filteredProducts.value {
                productsfiler = filter[index]
            }
        } else {
            if let prod = products.value {
                productsfiler = prod[index]
            }
        }
        return productsfiler
    }

    //MARK: - NavigationBar
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

//
//  MenuViewModel.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit
import FirebaseFirestore

final class MenuViewModel {
        
    func getProducts(complition: @escaping (Result<[Product], Error>) -> Void) {
        DataBaseService.shared.productsRef.getDocuments { qSnapsot, error in
            guard let qSnapsot = qSnapsot else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnapsot.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else { return }
                products.append(product)
            }
            complition(.success(products))
        }
    }
    
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

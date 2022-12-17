//
//  MenuViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit
import FirebaseFirestore

class MenuViewController: UIViewController {
    
    var viewModel = MenuViewModel()
    
    private var collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        viewModel.setupNavigationBar(navigationItem: navigationItem,
                                     navVc: navigationController,
                                     image: UIImage(named: "titleNavVc")!)
        getProduct()
    }
    
    func getProduct() {
        DataBaseService.shared.getProducts { result in
            self.configColletionView()
            switch result {
            case .success(let products):
                self.viewModel.products.value = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configColletionView() {
        collection.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.id)
        collection.backgroundColor = .none
        collection.showsVerticalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collection)
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
}

//MARK: Data Source & Delegate
extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.id, for: indexPath) as? MenuCell else { return UICollectionViewCell() }
        if let products = viewModel.products.value  {
            cell.setup(product: (products[indexPath.item]))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.1
        let heigth = collectionView.frame.height / 2.5
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        if let products = viewModel.products.value {
            vc.setup(product: products[indexPath.item])
            if products[indexPath.item].title == "🦐 Пірма" {
                vc.segmentetControl.removeSegment(at: 0, animated: true)
                vc.stacSirBort.isHidden = true
            }
        }
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

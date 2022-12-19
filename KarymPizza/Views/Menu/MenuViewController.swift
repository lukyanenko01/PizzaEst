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

    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        viewModel.setupNavigationBar(navigationItem: navigationItem,
                                     navVc: navigationController,
                                     image: UIImage(named: "titleNavVc")!)
        getProduct()
        setupSearchBar()
        setConstraints()
    }
    
    //MARK: - DataBase
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
    
    //MARK: - Configure CollectionView
    private func configColletionView() {
        collection.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.id)
        collection.backgroundColor = .none
        collection.showsVerticalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - SearchBar
    private func setupSearchBar() {
        searchController.searchBar.placeholder = "Пошук"
        searchController.searchBar.tintColor = .black
        searchController.searchBar.barTintColor = .black
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
    }
}

//MARK: - Constraints
extension MenuViewController {
    private func setConstraints() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - Collection DataSource & Delegate
extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.countCell(isFiltering: isFiltering)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.id, for: indexPath) as? MenuCell else { return UICollectionViewCell() }
        cell.setup(product: viewModel.filterForItemCell(isFiltering: isFiltering, index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        let productDidSelect = viewModel.didselectFiltrItem(isFiltering: isFiltering, index: indexPath.item)
        vc.setup(product: productDidSelect)
        if productDidSelect.title == "🦐 Пірма" {
            vc.segmentetControl.removeSegment(at: 0, animated: true)
            vc.stacSirBort.isHidden = false
        }
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.1
        var heigth: CGFloat = 0
        if collectionView.frame.height <= 670 {
            heigth = collectionView.frame.height / 2.5
        } else {
            heigth = collectionView.frame.height / 3
        }
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

//MARK: - UISearchBarDelegate
extension MenuViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        guard let products = viewModel.products.value else { return }
        viewModel.filteredProducts.value = products.filter({ (product: Product) -> Bool in
            return product.title.lowercased().contains(searchText.lowercased())
        })
        collection.reloadData()
    }
}

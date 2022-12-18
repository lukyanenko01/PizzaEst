//
//  HomeViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var viewModel = HomeViewModel()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        viewModel.setupNavigationBar(navigationItem: navigationItem,
                                     navVc: navigationController,
                                     image: UIImage(named: "titleNavVc")!)
        getProduct()
        setConstraints()
    }
    
    //MARK: - DataBase
    func getProduct() {
        DataBaseService.shared.getHomeSale { result in
            self.configTable()
            switch result {
            case .success(let products):
                self.viewModel.products.value = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK: - Configurate TableView
    private func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.id)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

//MARK: - Constraints
extension HomeViewController {
    private func setConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - TableView Delegate & DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        if let product = viewModel.products.value {
            cell.setup(product: product[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) 
    }
}

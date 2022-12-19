//
//  CartViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit
import FirebaseFirestore

class CartViewController: UIViewController {
    
    var total = 139
    
    //MARK: - UI
    public let tableView = UITableView()
    
    private let buttonOrder: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9976690412, green: 0.4560409784, blue: 0.3749637008, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        setupNavigationBar()
        configTable()
        buttonOrder.setTitle(" Оформити замовлення на: \(total) $", for: .normal)
        setConstraints()
    }
    
    //MARK: - Configurate TableView
    private func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.id)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Navigation Bar
    private func setupNavigationBar() {
        let imageView = UIImageView(image: UIImage(named: "titleNavVc"))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(rightButtonAction))
        rightButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightButtonAction() {
        
    }
}

//MARK: - Constraints
extension CartViewController {
    func setConstraints() {
        view.addSubview(tableView)
        view.addSubview(buttonOrder)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: buttonOrder.bottomAnchor, constant: 0),
            
            buttonOrder.heightAnchor.constraint(equalToConstant: 40),
            buttonOrder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonOrder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonOrder.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
        ])
    }
}

//MARK: - Table Delegate & DataSource
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.id, for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

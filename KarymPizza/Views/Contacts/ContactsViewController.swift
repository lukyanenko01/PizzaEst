//
//  ContactsViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit
import FirebaseAuth

class ContactsViewController: UIViewController {
    
    //MARK: - UI
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height+20)
    }
    
    private let imageMap: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "map")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLbl: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Зв’яжіться з нами, якщо вам потрібна допомога із замовленням"
        label.numberOfLines = 3
        label.font = UIFont(name: "Arial Bold", size: 18)
        return label
    }()
    
    private let adresLbl: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "вулиця Фортечна, 4 а, Запоріжжя, Запорізька область, 69061"
        label.numberOfLines = 3
        label.font = UIFont(name: "Arial", size: 14)
        return label
    }()
    
    private let graficLBL: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Графік: 11:00 - 22:00, 24/7"
        label.numberOfLines = 3
        label.font = UIFont(name: "Arial", size: 14)
        return label
    }()
    
    private let phoneLbl: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "+38 098 286 1789"
        label.numberOfLines = 3
        label.font = UIFont(name: "Arial", size: 14)
        return label
    }()
    
    private let delivaryLbl: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Доставка: при замовленні від 200грн, доставка по центру і старій частині міста, Безкоштовано. Заволення від 500грн, БЕЗКОШТОВНО по всьому місту!"
        label.numberOfLines = 0
        label.font = UIFont(name: "Arial", size: 14)
        return label
    }()
    
    private let buttonExit: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        button.setTitle("Розлогінитись", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 19)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stacVertical: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [titleLbl, adresLbl, graficLBL, phoneLbl, delivaryLbl, buttonExit])
        stac.axis = .vertical
        stac.spacing = 20
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    //MARK: - Life sycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        setupNavigationBar()
        setConstraints()
        buttonAction()
    }
    
    
    private func buttonAction() {
        buttonExit.addTarget(self, action: #selector(exitAction), for: .touchUpInside)
    }
    
    @objc func exitAction() {
        
        do {
            try Auth.auth().signOut()
            let vc = AuthViewController()
            vc.modalPresentationStyle = .overFullScreen
            showDetailViewController(vc, sender: nil)
        } catch {
            
        }
    }
    
    //MARK: - Navigation Bar
    func setupNavigationBar() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "titleNavVc"))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageMap)
        scrollView.addSubview(stacVertical)
        
        NSLayoutConstraint.activate([
            imageMap.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            imageMap.widthAnchor.constraint(equalToConstant: view.bounds.width-40),
            imageMap.heightAnchor.constraint(equalToConstant: view.bounds.height/4),
            imageMap.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            stacVertical.topAnchor.constraint(equalTo: imageMap.bottomAnchor, constant: 40),
            stacVertical.widthAnchor.constraint(equalToConstant: view.bounds.width-40),
            stacVertical.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buttonExit.widthAnchor.constraint(equalToConstant: view.bounds.width/2)
        ])
    }
}

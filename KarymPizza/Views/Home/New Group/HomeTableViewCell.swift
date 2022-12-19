//
//  HomeTableViewCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 17.12.2022.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    
    static let id = "HomeTableViewCell"
    
    private var mainView = HomeViewCell()
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3
        layer.cornerRadius = 3
    }
    //MARK: - Setup content in Cell
    public func setup(product: Home) {
        self.mainView.nameLbl.text = product.title
        self.mainView.descriptionLbl.text = product.descript
        let url = URL(string: product.imageUrl)
        self.mainView.imageView.sd_setImage(with: url)
    }

    //MARK: - Constraints
    func setConstraints() {
        addSubview(mainView)
        mainView.heightAnchor.constraint(equalToConstant: 290).isActive = true
        mainView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}

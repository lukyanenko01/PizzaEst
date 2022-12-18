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
        backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
        mainView.layer.cornerRadius = 6
        mainView.clipsToBounds = true
        mainView.layer.borderWidth = 1.5
        mainView.layer.borderColor = CGColor(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

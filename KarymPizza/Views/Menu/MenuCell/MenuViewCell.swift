//
//  MenuViewCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

class MenuViewCell: UIView {
    
    //MARK: - UI
    
    let nameLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 18), alignment: .center)
    private let priceSLbl = UILabel(text: "Розмір S", font: UIFont(name: "Arial", size: 14), alignment: .left)
    let totalSLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 14), alignment: .right)
    private let priceMLbl = UILabel(text: "Розмір M", font: UIFont(name: "Arial", size: 14), alignment: .left)
    let totalMLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 14), alignment: .right)
    private let priceXlLbl = UILabel(text: "Розмір Xl", font: UIFont(name: "Arial", size: 14), alignment: .left)
    let totalXlLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 14), alignment: .right)
    
    var productImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var stacImageName = UIStackView(arrangedSubviews: [productImageView, nameLbl], axis: .vertical, distribution: .equalSpacing)
    
    private lazy var stacTotalS = UIStackView(arrangedSubviews: [priceSLbl, totalSLbl], axis: .horizontal, distribution: .fillProportionally)
    
    private lazy var stacTotalM = UIStackView(arrangedSubviews: [priceMLbl, totalMLbl], axis: .horizontal, distribution: .fillProportionally)
    
    private lazy var stacTotalXl = UIStackView(arrangedSubviews: [priceXlLbl, totalXlLbl], axis: .horizontal, distribution: .fillProportionally)
    
     private lazy var stacMain: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [stacImageName, stacTotalS, stacTotalM, stacTotalXl])
        stac.axis = .vertical
        stac.spacing = 8
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 6
        setConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        addSubview(stacMain)
        NSLayoutConstraint.activate([
            stacMain.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stacMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stacMain.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stacMain.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}

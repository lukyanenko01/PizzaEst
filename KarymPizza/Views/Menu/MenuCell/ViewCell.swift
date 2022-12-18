//
//  ViewCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

class ViewCell: UIView {
    
    let nameLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 18), alignment: .center)
    private let priceSLbl = UILabel(text: "Розмір S", font: UIFont(name: "Arial", size: 14), alignment: .left)
    let totalSLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 14), alignment: .left)
    private let priceMLbl = UILabel(text: "Розмір M", font: UIFont(name: "Arial", size: 14), alignment: .left)
    let totalMLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 14), alignment: .right)
    private let priceXlLbl = UILabel(text: "Розмір Xl", font: UIFont(name: "Arial", size: 14), alignment: .left)
    let totalXlLbl = UILabel(text: "", font: UIFont(name: "Arial Bold", size: 14), alignment: .right)
    
    var productImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var stacImageName: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [productImageView, nameLbl])
        stac.axis = .vertical
        return stac
    }()
    
    private lazy var stacTotalS: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [priceSLbl, totalSLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
    private lazy var stacTotalM: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [priceMLbl, totalMLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
    private lazy var stacTotalXl: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [priceXlLbl, totalXlLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
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

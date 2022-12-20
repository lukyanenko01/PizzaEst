//
//  DetailsTestViewCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 20.12.2022.
//

import UIKit

class DetailsTestViewCell: UIView {
    
    var nameLbl: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 2
        label.text = "TestTest"
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    var sizeLbl = UILabel(text: "S", font: UIFont(name: "Arial Bold", size: 20), alignment: .left)
    var totalCountLbl = UILabel(text: "2", font: UIFont(name: "Arial Bold", size: 18), alignment: .left)
    var priceLbl = UILabel(text: "175", font: UIFont(name: "Arial Bold", size: 18), alignment: .left)
    
    private lazy var stacHorizontal: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [nameLbl, sizeLbl, totalCountLbl, priceLbl])
        stac.axis = .horizontal
        stac.distribution = .equalCentering
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setupViews()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        addSubview(stacHorizontal)
        NSLayoutConstraint.activate([
            stacHorizontal.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            stacHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            stacHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            stacHorizontal.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
        ])
    }
}

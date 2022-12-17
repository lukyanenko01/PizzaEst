//
//  MenuCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit
import SDWebImage

class MenuCell: UICollectionViewCell {
    
    static let id = "MenuCell"
    private let viewBacgraund = ViewCell()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 6
        layer.cornerRadius = 6
    }
    
    func setup(product: Product) {
        self.viewBacgraund.nameLbl.text = product.title
        self.viewBacgraund.totalSLbl.text = String(product.priceS)
        self.viewBacgraund.totalMLbl.text = String(product.priceM)
        self.viewBacgraund.totalXlLbl.text = String(product.priceXl)
        let url = URL(string: product.imageUrl)
        self.viewBacgraund.productImageView.sd_setImage(with: url)
    }
    
    //MARK: Constraints
    private func setConstraints() {
        contentView.addSubview(viewBacgraund)
        NSLayoutConstraint.activate([
            viewBacgraund.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            viewBacgraund.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            viewBacgraund.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            viewBacgraund.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
}

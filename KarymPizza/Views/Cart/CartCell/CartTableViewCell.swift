//
//  CartTableViewCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 19.12.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let id = "OrderCell"
    
    let viewBacgraund = CartViewCell()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Shadow for View
    private func setupView() {
        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 1.8
        layer.cornerRadius = 1.8
    }
    
    //MARK: - Public func
    public func setup(position: Position) {
        viewBacgraund.nameLbl.text = position.name
        viewBacgraund.totalCountLbl.text = String(position.count)
        viewBacgraund.priceLbl.text = String(position.price)
        viewBacgraund.sizeLbl.text = position.size
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        contentView.addSubview(viewBacgraund)
        NSLayoutConstraint.activate([
            viewBacgraund.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewBacgraund.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewBacgraund.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            viewBacgraund.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}


//
//  DetailOrderCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 20.12.2022.
//

import UIKit

class DetailOrderCell: UITableViewCell {
    
    static let id = "DetailOrderCell"
    
    var viewBacgraund = DetailsCellView()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewForCell(index: IndexPath) {
        if index.row == 1 {
            self.viewBacgraund.titleLbl.text = "Спосіб отримання"
            self.viewBacgraund.stacHorizontal.isHidden = true
        } else {
            self.viewBacgraund.titleLbl.text = "Сука"
            self.viewBacgraund.testSwitch.isHidden = true
        }
    }
    

    
    
    //MARK: - Constraints
    private func setConstraints() {
        contentView.addSubview(viewBacgraund)
        NSLayoutConstraint.activate([
            viewBacgraund.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewBacgraund.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewBacgraund.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            viewBacgraund.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            viewBacgraund.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}


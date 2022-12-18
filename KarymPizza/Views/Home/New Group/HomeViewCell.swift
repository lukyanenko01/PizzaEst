//
//  HomeViewCell.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 17.12.2022.
//

import UIKit

class HomeViewCell: UIView {
    
    //MARK: - UI
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "salse2")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLbl = UILabel(text: "Замов 5 піц, плати за 4", font: UIFont(name: "Avenir Next Demi Bold", size: 20), alignment: .left)
    
    let descriptionLbl: UILabel = {
        let lable = UILabel()
        lable.text = "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription"
        lable.font = UIFont(name: "Avenir Next Demi", size: 14)
        lable.textAlignment = .left
        lable.numberOfLines = 2
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    lazy var stacMain: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [imageView, nameLbl, descriptionLbl])
        stac.axis = .vertical
        stac.spacing = 6
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints
extension HomeViewCell {
    func setConstraints() {
        addSubview(stacMain)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 200),
            nameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stacMain.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stacMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stacMain.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}

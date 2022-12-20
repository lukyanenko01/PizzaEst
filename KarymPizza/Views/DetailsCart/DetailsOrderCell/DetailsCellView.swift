//
//  DetailsCellView.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 20.12.2022.
//

import UIKit

class DetailsCellView: UIView {
    
    var titleLbl = UILabel(text: "Спосіб отримання", font: UIFont(name: "Arial Bold", size: 20), alignment: .left)

    private var deliveryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderWidth = 1.5
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.setTitle("Доставка", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var selfButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderWidth = 1.5
        button.layer.borderColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        button.setTitle("З собою", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    lazy var stacHorizontal: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [deliveryButton, selfButton])
        stac.axis = .horizontal
        stac.spacing = 10
        stac.distribution = .fillProportionally
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    var testSwitch: UISwitch = {
        let testSwitch = UISwitch()
        testSwitch.translatesAutoresizingMaskIntoConstraints = false
        return testSwitch
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setupViews()
        translatesAutoresizingMaskIntoConstraints = false
        
        deliveryButton.addTarget(self, action: #selector(deliveryButtonAction), for: .touchUpInside)
        selfButton.addTarget(self, action: #selector(selfButtonAction), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deliveryButtonAction() {
        deliveryButton.setTitleColor(#colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1), for: .normal)
        deliveryButton.layer.borderColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        
        selfButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        selfButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func selfButtonAction() {
        selfButton.setTitleColor(#colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1), for: .normal)
        selfButton.layer.borderColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        
        deliveryButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        deliveryButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        addSubview(titleLbl)
        addSubview(stacHorizontal)
        addSubview(testSwitch)
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLbl.heightAnchor.constraint(equalToConstant: 40),
            
            stacHorizontal.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            stacHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stacHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stacHorizontal.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            testSwitch.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            testSwitch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
}

//
//  DetailsView.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import Foundation
import UIKit
import SDWebImage


class DetailsView: UIView {
    
     let imageView: UIImageView = {
       let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFill
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
   }()
    
     let imageView2: UIImageView = {
       let imageView = UIImageView()
       imageView.image = #imageLiteral(resourceName: "arrowsDV")
       imageView.contentMode = .scaleAspectFill
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
   }()
   
     var totalLbl: UILabel = {
      let label = UILabel()
       label.textAlignment = .center
       label.textColor = .white
       label.font = UIFont(name: "Avenir Next Demi Bold", size: 30)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
     let nameLbl: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Pizza"
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 35)
        return label
    }()
   
     let descriptionLbl: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       label.numberOfLines = 0
       label.textColor = .white
       label.font = UIFont(name: "Avenir Next Demi", size: 18)
       return label
   }()
    
    var titles = ["S", "M", "XL"]

     let segmentetControl: UISegmentedControl = {
        let title = ["S", "M", "XL"]
        let segControl = UISegmentedControl(items: title)
        segControl.selectedSegmentIndex = 1
        segControl.selectedSegmentTintColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        segControl.tintColor = .white
        segControl.backgroundColor = .clear
        return segControl
    }()
    
     let stepperCount: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.backgroundColor = .clear
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
     let countLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "1"
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        return label
    }()
    
     let sirBortSwitch: UISwitch = {
       let sirBortSwitch = UISwitch()
        sirBortSwitch.onTintColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        return sirBortSwitch
    }()
    
     let sirBortLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.text = "Сирний бортик +50 грн"
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        return label
    }()
    
     lazy var stacSirBort: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [sirBortSwitch, sirBortLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
     lazy var stacHorizontal: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [stepperCount, countLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
     lazy var stacVertical: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [nameLbl, descriptionLbl, segmentetControl, stacHorizontal, stacSirBort])
        stac.axis = .vertical
        stac.spacing = 25
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
     let buttonOrder: UIButton = {
      let button = UIButton()
       button.backgroundColor = .white
       button.setTitle("В корзину", for: .normal)
       button.setTitleColor(#colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1), for: .normal)
       button.setTitleColor(#colorLiteral(red: 0.9334695935, green: 0.4943215251, blue: 0.5397483706, alpha: 1), for: .selected)
       button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
       button.layer.cornerRadius = 20
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(imageView)
        addSubview(imageView2)
        addSubview(totalLbl)
        addSubview(stacVertical)
        addSubview(buttonOrder)
        NSLayoutConstraint.activate([
         stacVertical.topAnchor.constraint(equalTo: topAnchor, constant: 40),
         stacVertical.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
         stacVertical.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
         
         totalLbl.widthAnchor.constraint(equalToConstant: 120),
         totalLbl.heightAnchor.constraint(equalToConstant: 50),
         totalLbl.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
         totalLbl.bottomAnchor.constraint(equalTo: imageView2.topAnchor, constant: 20),
         
         imageView2.widthAnchor.constraint(equalToConstant: bounds.width/1.8),
         imageView2.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
         imageView2.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 50),
         
         imageView.heightAnchor.constraint(equalToConstant: bounds.height/1.5),
         imageView.widthAnchor.constraint(equalToConstant: bounds.width+80),
         imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
         imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bounds.height/3.5),
         
         buttonOrder.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
         buttonOrder.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
         buttonOrder.widthAnchor.constraint(equalToConstant: 160),
         buttonOrder.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

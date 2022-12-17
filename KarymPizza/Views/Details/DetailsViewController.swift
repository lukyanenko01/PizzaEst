//
//  DetailsViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
        
    var totalS = 0
    var totalM = 0
    var totalXl = 0
    var total = 0
        
    private let imageView: UIImageView = {
       let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFill
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
   }()
   
    private var totalLbl = UILabel(text: "", font: UIFont(name: "Avenir Next Demi Bold", size: 30), alignment: .center)
    private let nameLbl = UILabel(text: "", font: UIFont(name: "Avenir Next Demi Bold", size: 35), alignment: .center)
    private let descriptionLbl = UILabel(text: "", font: UIFont(name: "Avenir Next Demi", size: 18), alignment: .center)
    private let sirBortLbl = UILabel(text: "Сирний бортик +50 грн", font: UIFont(name: "Avenir Next Demi Bold", size: 20), alignment: .right)
    private let countLbl = UILabel(text: "1", font: UIFont(name: "Avenir Next Demi Bold", size: 20), alignment: .center)

     let segmentetControl: UISegmentedControl = {
        let title = ["S", "M", "XL"]
        let segControl = UISegmentedControl(items: title)
        segControl.selectedSegmentIndex = 1
        segControl.selectedSegmentTintColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        segControl.tintColor = .black
        segControl.backgroundColor = .clear
        return segControl
    }()
    
    private let stepperCount: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.backgroundColor = .clear
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    private let sirBortSwitch: UISwitch = {
       let sirBortSwitch = UISwitch()
        sirBortSwitch.onTintColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        return sirBortSwitch
    }()
    
     lazy var stacSirBort: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [sirBortSwitch, sirBortLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
    private lazy var stacHorizontal: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [stepperCount, countLbl])
        stac.axis = .horizontal
        stac.distribution = .fillProportionally
        return stac
    }()
    
    private lazy var stacVertical: UIStackView = {
        let stac = UIStackView(arrangedSubviews: [nameLbl, descriptionLbl, segmentetControl, stacHorizontal, stacSirBort])
        stac.axis = .vertical
        stac.spacing = 25
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    private let buttonOrder: UIButton = {
      let button = UIButton()
       button.backgroundColor = .white
       button.setTitle("В корзину", for: .normal)
       button.setTitleColor(#colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1), for: .normal)
       button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
       button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()

   override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = #colorLiteral(red: 0.9725244641, green: 0.9724023938, blue: 0.9807130694, alpha: 1)
       setupConstraints()
       action()
       total = totalM
   }
    
    
    func setup(product: Product) {
        self.nameLbl.text = product.title
        self.totalS = product.priceS
        self.totalM = product.priceM
        self.totalXl = product.priceXl
        self.descriptionLbl.text = product.descript
        let url = URL(string: product.imageUrl)
        self.imageView.sd_setImage(with: url)
    }
    
    private func action() {
                
        totalLbl.text = "\(totalM) ₴"
        
        stepperCount.addTarget(self, action: #selector(stepperAction), for: .allEvents)
        segmentetControl.addTarget(self, action: #selector(segmentedAction), for: .allEvents)
        buttonOrder.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        sirBortSwitch.addTarget(self, action: #selector(sirBortAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        self.dismiss(animated: true)
    }
    
    @objc func sirBortAction() {
        
        switch segmentetControl.selectedSegmentIndex {
        case 1:
            if segmentetControl.selectedSegmentIndex == 1 && self.sirBortSwitch.isOn == true {
                totalM += 50
                totalLbl.text = "\(totalM * Int(stepperCount.value)) ₴"
                total = totalM * Int(stepperCount.value)
            } else {
                totalM -= 50
                totalLbl.text = "\(totalM * Int(stepperCount.value)) ₴"
                total = totalM * Int(stepperCount.value)
            }
        case 2:
            if segmentetControl.selectedSegmentIndex == 2 && self.sirBortSwitch.isOn == true {
                totalXl += 100
                totalLbl.text = "\(totalXl * Int(stepperCount.value)) ₴"
                total = totalXl * Int(stepperCount.value)
            } else {
                totalXl -= 100
                totalLbl.text = "\(totalXl * Int(stepperCount.value)) ₴"
                total = totalXl * Int(stepperCount.value)
            }
        default: break
            
        }
    }
    
    @objc func stepperAction() {
        countLbl.text = String(Int(stepperCount.value))
        
        switch segmentetControl.selectedSegmentIndex {
        case 0:
            totalLbl.text = "\(Int(stepperCount.value) * totalS) ₴"
            total = (Int(stepperCount.value) * totalS)
        case 1:
            totalLbl.text = "\(Int(stepperCount.value) * totalM) ₴"
            total = (Int(stepperCount.value) * totalM)
        case 2:
            totalLbl.text = "\(Int(stepperCount.value) * totalXl) ₴"
            total = (Int(stepperCount.value) * totalXl)
        default: break
        }
    }
    
    @objc func segmentedAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            totalLbl.text = "\(totalS) ₴"
            total = totalS
            stepperCount.value = 1
            countLbl.text = "\(1)"
            self.stacSirBort.isHidden = true
            print("totalM: \(totalM)")
            print("totalXl: \(totalXl)")
        case 1:
            self.stacSirBort.isHidden = false
            self.sirBortLbl.text = "Сирний бортик +50 грн"
            if sirBortSwitch.isOn == true {
                sirBortSwitch.isOn = false
                totalXl -= 100
            }
            print("totalM: \(totalM)")
            print("totalXl: \(totalXl)")
                
            totalLbl.text = "\(totalM) ₴"
            total = totalM
            stepperCount.value = 1
            countLbl.text = "\(1)"
        case 2:
            self.stacSirBort.isHidden = false
            self.sirBortLbl.text = "Сирний бортик +100 грн"
            if sirBortSwitch.isOn == true {
                sirBortSwitch.isOn = false
                totalM -= 50
            }
            print("totalM: \(totalM)")
            print("totalXl: \(totalXl)")
            totalLbl.text = "\(totalXl) ₴"
            total = totalXl
            stepperCount.value = 1
            countLbl.text = "\(1)"
        default:
            totalLbl.text = "0 ₴"
        }
    }
    
  
   
   
   private func setupConstraints() {
       view.addSubview(imageView)
       view.addSubview(totalLbl)
       view.addSubview(stacVertical)
       view.addSubview(buttonOrder)
       NSLayoutConstraint.activate([
        stacVertical.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
        stacVertical.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        stacVertical.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        totalLbl.widthAnchor.constraint(equalToConstant: 120),
        totalLbl.heightAnchor.constraint(equalToConstant: 50),
        totalLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        totalLbl.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 20),
        
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.height/1.5),
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width+80),
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.bounds.height/3.5),
        
        buttonOrder.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        buttonOrder.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        buttonOrder.widthAnchor.constraint(equalToConstant: 160),
        buttonOrder.heightAnchor.constraint(equalToConstant: 50)
       ])
   }
}



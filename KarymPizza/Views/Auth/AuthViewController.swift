//
//  AuthViewController.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import Foundation
import FirebaseAuth
import FlagPhoneNumber

class AuthViewController: UIViewController {
    
    var phoneNumber: String?

    private let viewBacgraund: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.8101552328)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 22)
        label.textColor = .white
        label.text = "Реєстрація"
        return label
    }()
    
    private let phoneTextField = FPNTextField()

        
    private let buttonEnter: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        button.setTitle("Отримати код", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 19)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    private lazy var stacVertical: UIStackView = {
       let stac = UIStackView(arrangedSubviews: [titleLbl, phoneTextField, buttonEnter])
        stac.axis = .vertical
        stac.spacing = 20
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
                
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "auth2")!)
        setConstraint()
        setupConfig()
        buttonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            if Auth.auth().currentUser?.uid == "SVPhhUtu90bCde1pm1FoZbXuYoT2" {
//                let vc = AdminViewController()
//                vc.modalPresentationStyle = .overFullScreen
//                self.showDetailViewController(vc, sender: nil)
            } else if Auth.auth().currentUser?.uid != nil {
                let vc = MainTabBarController()
                vc.modalPresentationStyle = .overFullScreen
                self.showDetailViewController(vc, sender: nil)
            }
        }
        self.dismiss(animated: true)
    }
    
    private func buttonAction() {
        buttonEnter.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
    }
    
    @objc func enterAction() {
        guard phoneNumber != nil else { return }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) { [weak self] varification, error in
            guard let self = self else { return }
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                self.showCodeValid(varification: varification ?? "")
            }
        }
    }
    
    private func showCodeValid(varification: String) {
        let vc = CodeValidVC()
        vc.varificationID = varification
        vc.modalPresentationStyle = .overFullScreen
        self.showDetailViewController(vc, sender: nil)
    }
    
    private func setupConfig() {
        buttonEnter.alpha = 0.5
        buttonEnter.isEnabled = false

        phoneTextField.delegate = self
    }
    
    private func setConstraint() {
        view.addSubview(viewBacgraund)
        view.addSubview(stacVertical)
        
        NSLayoutConstraint.activate([
            viewBacgraund.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBacgraund.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            viewBacgraund.widthAnchor.constraint(equalToConstant: view.bounds.width-50),
            viewBacgraund.heightAnchor.constraint(equalToConstant: view.bounds.height/4),

            buttonEnter.heightAnchor.constraint(equalToConstant: 50),
            stacVertical.centerXAnchor.constraint(equalTo: viewBacgraund.centerXAnchor),
            stacVertical.centerYAnchor.constraint(equalTo: viewBacgraund.centerYAnchor),
            stacVertical.leadingAnchor.constraint(equalTo: viewBacgraund.leadingAnchor, constant: 20),
            stacVertical.trailingAnchor.constraint(equalTo: viewBacgraund.trailingAnchor, constant: -20)
        ])
    }
}


extension AuthViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        /// действия после нажатия на страну
    }
    
        // делать кнопку активной или нет
    func fpnDidValidatePhoneNumber(textField: FlagPhoneNumber.FPNTextField, isValid: Bool) {
        if isValid {
            buttonEnter.alpha = 1
            buttonEnter.isEnabled = true

            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            buttonEnter.alpha = 0.5
            buttonEnter.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
      /// что бы отображать лист контроллер
    }
}

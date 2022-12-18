//
//  CodeValidVC.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import UIKit
import FirebaseAuth

class CodeValidVC: UIViewController {
    
    var varificationID: String!
    
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
        label.text = "Введіть отриманий код"
        return label
    }()
    
    private let codeTextView: UITextView = {
       let textView = UITextView()
        textView.text = ""
        textView.textColor = .white
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.keyboardType = .phonePad
        textView.font = UIFont(name: "Avenir Next Demi Bold", size: 22)
        return textView
    }()

        
    private let buttonEnter: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8882787824, green: 0.158880502, blue: 0.2406231761, alpha: 1)
        button.setTitle("Перевірити код", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 19)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    private lazy var stacVertical: UIStackView = {
       let stac = UIStackView(arrangedSubviews: [titleLbl, codeTextView, buttonEnter])
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
    
    private func buttonAction() {
        buttonEnter.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
    }
    
    @objc func enterAction() {
        
        guard let code = codeTextView.text else { return }
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: varificationID, verificationCode: code)
        
        Auth.auth().signIn(with: credetional) { [weak self] _, error in
            guard let self = self else { return }
            if error != nil {
                let ac = UIAlertController(title: error?.localizedDescription, message: nil, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Відміна", style: .cancel)
                ac.addAction(cancel)
                self.present(ac, animated: true)
            } else {
                self.showMainController()
            }
        }
    }
    
    private func showMainController() {
        let vc = MainTabBarController()
        vc.modalPresentationStyle = .overFullScreen
        showDetailViewController(vc, sender: nil)
    }
    
    private func setupConfig() {
        buttonEnter.alpha = 0.5
        buttonEnter.isEnabled = false
        codeTextView.delegate = self
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
            codeTextView.heightAnchor.constraint(equalToConstant: 50),
            stacVertical.centerXAnchor.constraint(equalTo: viewBacgraund.centerXAnchor),
            stacVertical.centerYAnchor.constraint(equalTo: viewBacgraund.centerYAnchor),
            stacVertical.leadingAnchor.constraint(equalTo: viewBacgraund.leadingAnchor, constant: 20),
            stacVertical.trailingAnchor.constraint(equalTo: viewBacgraund.trailingAnchor, constant: -20)
        ])
    }
}

extension CodeValidVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let curentCharacterCount = textView.text.count
        
        if range.length + range.location > curentCharacterCount {
            return false
        }
        let newLength = curentCharacterCount + text.count - range.length
        return newLength <= 6
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 6 {
            buttonEnter.alpha = 1
            buttonEnter.isEnabled = true
        } else {
            buttonEnter.alpha = 0.5
            buttonEnter.isEnabled = false
        }
    }
    
}

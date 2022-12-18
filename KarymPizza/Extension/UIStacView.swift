//
//  UIStacView.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
    }
    
}

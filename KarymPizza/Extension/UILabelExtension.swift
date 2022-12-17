//
//  UILabelExtension.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import UIKit

extension UILabel {    
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.textColor = #colorLiteral(red: 0.168045789, green: 0.1881615222, blue: 0.1966018081, alpha: 1)
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

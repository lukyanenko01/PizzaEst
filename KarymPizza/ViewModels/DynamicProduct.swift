//
//  DynamicProduct.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import Foundation

class DynamicProduct<T> {
    var value: T? {
        didSet {
            if lisener != nil {
                lisener!(value)
            }
        }
    }
    
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var lisener: ((T?) -> Void)?
    
    func bind(_ lisener: @escaping (T?) -> Void) {
        lisener(value)
        self.lisener = lisener
    }
}

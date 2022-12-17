//
//  Dynamic.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 14.12.2022.
//

import Foundation

class Dynamic<T> {
    var value: T? {
        didSet {
            lisener.forEach {
                $0(value)
            }
        }
    }
    
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var lisener: [((T?) -> Void)] = []
    
    func bind(_ lisener: @escaping (T?) -> Void) {
        lisener(value)
        self.lisener.append(lisener) 
    }
}

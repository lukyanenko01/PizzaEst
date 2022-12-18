//
//  Position.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import Foundation
import FirebaseFirestore

class Position {
    var id: String
    var name: String
    var count: Int = 0
    var price: Int = 0
    var size: String = ""
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["count"] = self.count
        repres["price"] = self.price
        repres["size"] = self.size
        return repres
    }
    
    internal init(id: String = UUID().uuidString,
                  name: String,
                  count: Int,
                  price: Int,
                  size: String) {
        self.id = id
        self.name = name
        self.count = count
        self.price = price
        self.size = size
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let name = data["name"] as? String else { return nil }
        guard let count = data["count"] as? Int else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let size = data["size"] as? String else { return nil }
        
        self.id = id
        self.name = name
        self.count = count
        self.price = price
        self.size = size
    }
}

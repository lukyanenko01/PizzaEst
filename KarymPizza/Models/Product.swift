//
//  Product.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import Foundation
import UIKit
import FirebaseFirestore

class Product {
    
    var id: String
    var title: String
    var imageUrl: String = ""
    var priceS: Int
    var priceM: Int
    var priceXl: Int
    var descript: String
    
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["priceS"] = self.priceS
        repres["priceM"] = self.priceM
        repres["priceXl"] = self.priceXl
        repres["descript"] = self.descript
        repres["imageUrl"] = self.imageUrl
        return repres
    }
    
    internal init(id: String = UUID().uuidString,
                  title: String,
                  imageUrl: String = "",
                  priceS: Int,
                  priceM: Int,
                  priceXl: Int,
                  descript: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.priceS = priceS
        self.priceM = priceM
        self.priceXl = priceXl
        self.descript = descript
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let priceS = data["priceS"] as? Int else { return nil }
        guard let priceM = data["priceM"] as? Int else { return nil }
        guard let priceXl = data["priceXl"] as? Int else { return nil }
        guard let descript = data["descript"] as? String else { return nil }
        guard let imageUrl = data["imageUrl"] as? String else { return nil }

        
        self.id = id
        self.title = title
        self.priceS = priceS
        self.priceM = priceM
        self.priceXl = priceXl
        self.descript = descript
        self.imageUrl = imageUrl
    }
    
}

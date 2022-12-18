//
//  Home.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 18.12.2022.
//

import UIKit
import FirebaseFirestore

class Home {
    
    var id: String
    var imageUrl: String = ""
    var title: String
    var descript: String
    
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["imageUrl"] = self.imageUrl
        repres["title"] = self.title
        repres["descript"] = self.descript
        return repres
    }
    
    internal init(id: String = UUID().uuidString,
                  imageUrl: String = "",
                  title: String,
                  descript: String) {
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
        self.descript = descript
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let imageUrl = data["imageUrl"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let descript = data["descript"] as? String else { return nil }
        
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
        self.descript = descript
    }
    
}

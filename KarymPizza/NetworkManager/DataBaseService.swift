//
//  DataBaseService.swift
//  KarymPizza
//
//  Created by Vladimir Lukyanenko on 13.12.2022.
//

import Foundation
import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
     var productsRef: CollectionReference {
        return db.collection("Menu")
    }
}


    
    



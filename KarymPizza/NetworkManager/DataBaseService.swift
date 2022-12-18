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
    
    var homeRef: CollectionReference {
        return db.collection("Home")
    }
    
    //MARK: - Get Product
    func getProducts(complition: @escaping (Result<[Product], Error>) -> Void) {
        productsRef.getDocuments { qSnapsot, error in
            guard let qSnapsot = qSnapsot else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnapsot.documents
            var products = [Product]()
            for doc in docs {
                guard let product = Product(doc: doc) else { return }
                products.append(product)
            }
            complition(.success(products))
        }
    }
    
    //MARK: - Get Home Sale
    func getHomeSale(complition: @escaping (Result<[Home], Error>) -> Void) {
        homeRef.getDocuments { qSnapsot, error in
            guard let qSnapsot = qSnapsot else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnapsot.documents
            var products = [Home]()
            for doc in docs {
                guard let product = Home(doc: doc) else { return }
                products.append(product)
            }
            complition(.success(products))
        }
    }
}


    
    



//
//  ProductModel.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import Foundation
struct RatingObject:Identifiable,Hashable{
    var id: UUID
    let rate:Double
    let count:Int
    init(id: UUID, rate: Double, count: Int) {
        self.id = id
        self.rate = rate
        self.count = count
    }
    func hash(into hasher: inout Hasher) {
        
    }
}
struct ProductModel:Identifiable,Hashable{
    var id: UUID
    func hash(into hasher: inout Hasher) {
        
    }
    let title:String
    let price:Double
    let description:String
    let category:String
    let image:String
    let rating:RatingObject
    init(id: UUID, title: String, price: Double, description: String, category: String, image: String, rating: RatingObject) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.image = image
        self.rating = rating
    }
    
    
    
    
}

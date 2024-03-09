//
//  DataProduct.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import Foundation
import SwiftData
@Model
final class DataProduct {
    var title = ""
    var price = 0.0
    var descriptionProduct = ""
    var category = ""
    var image = ""
    var rate:Double
    var count:Int
    init(title: String = "", price: Double = 0.0, descriptionProduct: String = "", category: String = "", image: String = "", rate: Double, count: Int) {
        self.title = title
        self.price = price
        self.descriptionProduct = descriptionProduct
        self.category = category
        self.image = image
        self.rate = rate
        self.count = count
    }
   
}

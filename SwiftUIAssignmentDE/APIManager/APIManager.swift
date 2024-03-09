//
//  APIManager.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON
class APIManager{
    static let shared = APIManager()
    private init(){}
    func getAPIProducts(onSuccess:@escaping ([ProductModel])->(),onFail:@escaping (Int)->Void)  {
        AF.request("https://fakestoreapi.com/products/")
            .response { response in
                switch response.result {
                case .success(let data):
                    do{
                        let json = try JSON(data:data!)
                        var array:[ProductModel] = []
                        for item in 0..<json.count{
                            let model = ProductModel(id: UUID(), title: json[item]["title"].string!, price: json[item]["price"].double!, description: json[item]["description"].string!, category: json[item]["category"].string!, image: json[item]["image"].string!, rating: .init(id: UUID(), rate: json[item]["rating"]["rate"].double!, count: json[item]["rating"]["count"].intValue))
                            array.append(model)
                        }
                        onSuccess(array)
                    }catch{
                        debugPrint("somethinw went wrong!!!!")
                    }
                case .failure(let error):
                    debugPrint("something went wrong!!!!",error.localizedDescription)

                }
            }.resume()
    }
}

//
//  ProductViewModel.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import Foundation
import Alamofire
import RxSwift
import RxRelay
import SwiftData
class ProductsViewModel{
    var apishared:APIManager
    init() {
        apishared = APIManager.shared
    }
    
  
    func getProducts()->Observable<[ProductModel]>{
        return Observable.create { observer -> Disposable in
            self.apishared.getAPIProducts { productsArray in
                observer.onNext(productsArray)
            } onFail: { value in
                debugPrint("something went wrong=",value)
            }
            
            return Disposables.create()
        }
    }
   
    func createMenu()->Observable<[String]>{
        return Observable.create { observer -> Disposable in
            observer.onNext(["Top Rated","Nearest to me","Cost High to Low ","Cost Low to High"])
            return Disposables.create()
        }
    }
}

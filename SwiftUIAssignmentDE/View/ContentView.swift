//
//  ContentView.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import SwiftUI
import SwiftData
import RxSwift
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI
struct ContentView: View {
    @Query private var items: [DataProduct]
    @Environment(\.modelContext) private var modelContext
    @State var arrayValues:[ProductModel] = []
    @State var offLinearrayValues:[DataProduct] = []
    let disposeBag = DisposeBag()
    @State var viewModel = ProductsViewModel()
    @StateObject var checkOnline = Helper()
    @State var searchField:String
    var body: some View {
        NavigationStack{
            HStack{
                TextField("Search Text", text: $searchField).padding(30)
                NavigationLink {
                    PopupView()
                } label: {
                    Image("filter")
                }
            }
                Text("Discover New Places")
                if checkOnline.isOnline{
                    List(arrayValues,id:\.self){item in
                        NavigationLink {
                            DetailsView(product: item, offlineProduct: .init(title: "", price: 0.0, descriptionProduct: "", category: "", image: "", rate: 0.0, count: 0))
                        } label: {
                            Cell(product: item,offlineProduct:  .init(title: "", price: 0.0, descriptionProduct: "", category: "", image: "", rate: 0.0, count: 0))
                        }
                        
                    }.onAppear(perform: {
                                viewModel.getProducts()
                                    .observe(on: MainScheduler.instance)
                                    .subscribe { array in
                                        arrayValues.append(contentsOf: array)
                                    }.disposed(by: disposeBag)
                                saveOffLineProducts()
                    }).navigationTitle("Assignment")
                        .navigationBarTitleDisplayMode(.inline)
                }else{
                    List(offLinearrayValues,id:\.self){item in
                        NavigationLink {
                            DetailsView(product: .none, offlineProduct:item)
                        } label: {
                            Cell(product: .none,offlineProduct:item)
                        }
                        
                    }.onAppear(perform: {
                        fetchSwiftDataProducts()
                                    .observe(on: MainScheduler.instance)
                                    .subscribe { products in
                                        self.offLinearrayValues.append(contentsOf: products)
                                    }.disposed(by: disposeBag)
                    }).navigationTitle("Assignment")
                        .navigationBarTitleDisplayMode(.inline)
                }
                
        }

    }
    func saveOffLineProducts(){
        APIManager.shared.getAPIProducts { productsArray in
            Task{
                for product in 0..<productsArray.count{
                    let swiftData = DataProduct(title: productsArray[product].title, price: productsArray[product].price, descriptionProduct: productsArray[product].description, category: productsArray[product].category, image: productsArray[product].image,rate:productsArray[product].rating.rate,count:productsArray[product].rating.count)
                        modelContext.insert(swiftData)
                        try modelContext.save()
                }
            }
        } onFail: { value in
            debugPrint("saveOfflineProducts=",value)
        }
    }
    func fetchSwiftDataProducts()->Observable<[DataProduct]>{
        return Observable.create { observer -> Disposable in
            observer.onNext(self.items)
            return Disposables.create()
        }
    }
}

#Preview {
    ContentView(searchField:"")
        .modelContainer(for: DataProduct.self, inMemory: true)
}

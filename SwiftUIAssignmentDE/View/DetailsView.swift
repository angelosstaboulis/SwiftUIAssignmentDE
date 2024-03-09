//
//  DetailsView.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI
struct DetailsView: View {
    var product:ProductModel!
    var offlineProduct:DataProduct
    @StateObject var checkOnline = Helper()
    var body: some View {
        if checkOnline.isOnline{
            VStack{
                WebImage(url: URL(string: product.image)) { image in
                       image.resizable()
                   } placeholder: {
                           Rectangle().foregroundColor(.gray)
                   }
                   .onSuccess { image, data, cacheType in
                      
                   }
                   .indicator(.activity)
                   .transition(.fade(duration: 0.5))
                   .scaledToFit()
                   .frame(width: 300, height: 300, alignment: .center)
                Text(product.title).font(.system(size: 12))
                Text(product.description).font(.system(size: 12))
                HStack{
                    Image("rating")
                    Text(String(describing:product.rating.rate)).font(.system(size: 12))
                    Text("("+String(describing:product.rating.count)+" ratings)").font(.system(size: 12))
                }
                Text(String(describing:product.price)).font(.system(size: 12))
            }.navigationTitle("Details Screen")
            .navigationBarTitleDisplayMode(.inline)
        }else{
            VStack{
                WebImage(url: URL(string: offlineProduct.image)) { image in
                       image.resizable()
                   } placeholder: {
                           Rectangle().foregroundColor(.gray)
                   }
                   .onSuccess { image, data, cacheType in
                      
                   }
                   .indicator(.activity)
                   .transition(.fade(duration: 0.5))
                   .scaledToFit()
                   .frame(width: 300, height: 300, alignment: .center)
                Text(offlineProduct.title).font(.system(size: 12))
                Text(offlineProduct.descriptionProduct).font(.system(size: 12))
                HStack{
                    Image("rating")
                    Text(String(describing:offlineProduct.rate)).font(.system(size: 12))
                    Text("("+String(describing:offlineProduct.count)+" ratings)").font(.system(size: 12))
                }
                Text(String(describing:offlineProduct.price)).font(.system(size: 12))
            }.navigationTitle("Details Screen")
            .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

#Preview {
    DetailsView(offlineProduct: .init(title: "", price: 0.0, descriptionProduct: "", category: "", image: "", rate: 0.0, count: 0))
}

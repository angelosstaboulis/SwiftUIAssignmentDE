//
//  Cell.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import SwiftUI
import SDWebImageSwiftUI
struct Cell: View {
    var product:ProductModel!
    var offlineProduct:DataProduct!
    @StateObject var checkOnline = Helper()
    var body: some View {
        if checkOnline.isOnline {
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
                Text(product.title)
                Text(product.description)
                HStack{
                    Image("rating")
                    Text(String(describing:product.rating.rate))
                    Text("("+String(describing:product.rating.count)+" ratings)")
                }
                Text(String(describing:product.price))
            }
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
                Text(offlineProduct.title)
                Text(offlineProduct.descriptionProduct)
                HStack{
                    Image("rating")
                    Text(String(describing:offlineProduct.rate))
                    Text("("+String(describing:offlineProduct.count)+" ratings)")
                }
                Text(String(describing:offlineProduct.price))
            }
        }

    }
}

#Preview {
    Cell()
}

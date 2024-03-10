//
//  PopupView.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import SwiftUI
import RxSwift
struct PopupView: View {
    @Environment(\.dismiss) var dismiss
    @State var menusText = ["American","Turkey","Asia","Fast Food","Pizza","Desserd","Mexican"]
    @State var menus:[String] = []
    @State var viewModel = ProductsViewModel()
    let disposeBag = DisposeBag()
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Text("Reset")
                    }
                }
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
            HStack{
                Button {
                    
                } label: {
                    Text(menusText[0]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                        
                    }
                }
               
                Button {
                    
                } label: {
                    Text(menusText[1]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                        
                    }
                }
                Button {
                    
                } label: {
                    Text(menusText[2]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                        
                    }
                }
            }.padding(15)
            HStack{
                Button {
                    
                } label: {
                    Text(menusText[3]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                    }
                }
                Button {
                    
                } label: {
                    Text(menusText[4]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                    }
                }
                Button {
                    
                } label: {
                    Text(menusText[5]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                    }
                }
            }.padding(15)
            HStack{
                Button {
                    
                } label: {
                    Text(menusText[6]).overlay {
                        RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 1)
                    }
                }
              
            }.padding(15)
        }

        List(menus,id:\.self){item in
                Text(item)
        }.onAppear(perform: {
            viewModel.createMenu()
                .observe(on: MainScheduler.instance)
                .subscribe { array in
                    menus.append(contentsOf:array)
                }.disposed(by: disposeBag)
        })
    }
}

#Preview {
    PopupView()
}

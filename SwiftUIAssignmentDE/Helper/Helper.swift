//
//  Helper.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import Foundation
import Network
class Helper:ObservableObject{
    @Published var isOnline = Bool()
   
    func checkOnline(){
        DispatchQueue.main.async{
            let monitor = NWPathMonitor()
            monitor.start(queue: .main)
            monitor.pathUpdateHandler = { [weak self] path in
                if path.status == .satisfied{
                    self!.isOnline = true
                }else{
                    self!.isOnline = false
                }
            }
        }
    }

}

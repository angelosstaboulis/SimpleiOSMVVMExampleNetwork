//
//  IPInfoViewModel.swift
//  MMVMExampleNetwork
//
//  Created by Angelos Staboulis on 18/4/21.
//

import Foundation

class IPInfoViewModel{
    init(model:[IPInfo]?=nil) {
        if let getIP = model {
            ipinfo = getIP
        }
    }
    var ipinfo:[IPInfo]=[]
    func configureView(view:IPInfoView){
        view.lblValue.text = ipinfo.first?.ip
    }
    func fetchIPInfo(completion:@escaping ([IPInfo])->()){
        APIManager.shared.fetchIP { (array) in
                self.ipinfo = array
                completion(self.ipinfo)
        }
    }
}

//
//  IPInfoViewModel.swift
//  MMVMExampleNetwork
//
//  Created by Angelos Staboulis on 18/4/21.
//

import Foundation
protocol IPInfoDelegate:AnyObject{
    func fetchIPInfo(completion:@escaping (IPInfo)->())
    func configureView(view:IPInfoView)
}
class IPInfoViewModel{
    weak var delegate:IPInfoDelegate?
    init(model:IPInfo?=nil) {
        if let getIP = model {
            ipinfo = getIP
        }
    }
    var ipinfo:IPInfo!
    func configureView(view:IPInfoView){
        delegate?.configureView(view: view)
    }
    func fetchIPInfo(completion:@escaping (IPInfo)->()){
        delegate?.fetchIPInfo(completion: completion)
    }
}

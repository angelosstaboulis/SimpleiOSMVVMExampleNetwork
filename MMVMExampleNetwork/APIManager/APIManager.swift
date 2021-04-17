//
//  APIManager.swift
//  MMVMExampleNetwork
//
//  Created by Angelos Staboulis on 17/4/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class APIManager{
    static let shared = APIManager()
    var ipINFO:[IPInfo]=[]
    private init(){}
    func fetchIP(completion:@escaping ([IPInfo])->()){
        let urlMain = URL(string: "https://api.ipify.org?format=json")
        let request = URLRequest(url: urlMain!)
        AF.request(request)
            .responseJSON { (response) in
                let json = JSON(response.data!)
                self.ipINFO.append(IPInfo(ip: json["ip"].stringValue))
                completion(self.ipINFO)
            }
    }
}

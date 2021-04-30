//
//  IPInfoViewController.swift
//  MMVMExampleNetwork
//
//  Created by Angelos Staboulis on 18/4/21.
//

import UIKit
protocol IPInfoViewDelegate:AnyObject{
    func fetchIPInfo()
}
class IPInfoViewController: UIViewController {
    @IBOutlet var ipVIEW: IPInfoView!
    var ipINFOViewModel:IPInfoViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchIPInfo()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension IPInfoViewController:IPInfoViewDelegate{
    func fetchIPInfo() {
        ipINFOViewModel = IPInfoViewModel()
        ipINFOViewModel.delegate = self
        ipINFOViewModel.fetchIPInfo { (model) in
            self.ipINFOViewModel.ipinfo = model
            DispatchQueue.main.async{
                self.ipINFOViewModel.configureView(view: self.ipVIEW)
            }
        }
    }
}
extension IPInfoViewController:IPInfoDelegate{
    func fetchIPInfo(completion: @escaping (IPInfo) -> ()) {
        APIManager.shared.fetchIP { (model) in
                self.ipINFOViewModel.ipinfo = model
                completion(self.ipINFOViewModel.ipinfo)
        }
    }
    
    func configureView(view: IPInfoView) {
        view.lblValue.text = self.ipINFOViewModel.ipinfo.ip
    }
}

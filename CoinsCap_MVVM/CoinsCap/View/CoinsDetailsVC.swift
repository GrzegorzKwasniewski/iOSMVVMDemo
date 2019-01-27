//
//  CoinsDetailsVC.swift
//  CoinsCap_RxSwift
//

import UIKit

class CoinsDetailsVC: UIViewController {
    
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinValue: UILabel!
    
    var singleCoin: Coin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinName.text = singleCoin?.coinName
        coinValue.text = singleCoin?.coinPrice
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

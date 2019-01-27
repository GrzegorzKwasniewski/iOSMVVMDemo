//
//  ViewModel.swift
//  CoinsCap_MVVM
//

import Foundation
import RxSwift
import RxCocoa

class MainViewViewModel: ViewModelProtocol {
    
    // RxSwift Properties
    
    let coinsCollection = Variable<[Coin]>([Coin]())
    
    // WebService
    
    var webService: WebServiceProtocol
    
    // Initializer

    required init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    // Get data from server
    
    func getCurrentCoinsCap() {
        webService.getCoinsData(fromUrl: "https://api.coinmarketcap.com/v1/ticker/") { (coins, errorMessage) in
            
            switch (coins, errorMessage) {
            case (let coin?, nil):
                
                self.coinsCollection.value = coin
                
            case (_, .some(let errorMessage)):
                print(errorMessage)
            case (.none, .none):
                print("Defult case")
            }
        }
    }
}

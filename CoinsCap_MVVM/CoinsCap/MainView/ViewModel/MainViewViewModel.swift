//
//  ViewModel.swift
//  CoinsCap_MVVM
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelProtocol {
    
    init(webService: WebServiceProtocol)
    
    var coinsCollection: BehaviorRelay<[Coin]> {get}
    var webService: WebServiceProtocol {get}
    var coinsCount: Int {get}

    func getCurrentCoinsCap()
    func getCoin(forRow row: Int) -> Coin
}

final class MainViewViewModel: ViewModelProtocol {
    
    // MARK: PUBLIC PROPERTIES
    //---------------------------------------------------------------------------
    
    let webService: WebServiceProtocol
    let coinsCollection = BehaviorRelay<[Coin]>(value: [Coin]())
    
    var coinsCount: Int {
        return coinsCollection.value.count
    }
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------

    required init(webService: WebServiceProtocol = WebService()) {
        self.webService = webService
    }
    
    // MARK: PUBLIC METHODS
    //---------------------------------------------------------------------------
    
    func getCurrentCoinsCap() {
        webService.getCoinsData(fromUrl: "https://api.coinmarketcap.com/v1/ticker/") { (coins, errorMessage) in
            
            switch (coins, errorMessage) {
            case (let coins?, nil):
                
                self.coinsCollection.accept(coins)
                
            case (_, .some(let errorMessage)):
                print(errorMessage)
            case (.none, .none):
                print("Defult case")
            }
        }
    }
    
    func getCoin(forRow row: Int) -> Coin {
        return coinsCollection.value[row]
    }
}

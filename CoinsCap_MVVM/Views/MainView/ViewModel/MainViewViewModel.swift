//
//  ViewModel.swift
//  CoinsCap_MVVM
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelProtocol {
    
    init(webService: WebServiceProtocol)
    
    var onShowSingleCoin: ((Coin) -> Void)? {get set}
    
    var coinsCollection: BehaviorRelay<[Coin]> {get}
    var errorMessage: BehaviorRelay<String> {get}
    var webService: WebServiceProtocol {get}
    var coinsCount: Int {get}

    func getCurrentCoinsCap()
    func getCoin(forRow row: Int) -> Coin
}

final class MainViewViewModel: ViewModelProtocol {
    
    // MARK: NAVIGATION CALLBACKS
    //---------------------------------------------------------------------------
    
    var onShowSingleCoin: ((Coin) -> Void)?
    
    // MARK: PUBLIC PROPERTIES
    //---------------------------------------------------------------------------
    
    let webService: WebServiceProtocol
    let coinsCollection = BehaviorRelay<[Coin]>(value: [Coin]())
    let errorMessage = BehaviorRelay<String>(value: "")
    
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
        webService.getCoinsData { [weak self] (coins, errorMessage) in
            
            switch (coins, errorMessage) {
            case (let coins?, nil):
                                
                self?.coinsCollection.accept(coins)
                
            case (_, .some(let errorMessage)):
                
                self?.errorMessage.accept(errorMessage)
                
            case (.none, .none):
                print("Defult case")
            }
        }
    }
    
    func getCoin(forRow row: Int) -> Coin {
        return coinsCollection.value[row]
    }
}

//
//  ViewModelProtocol.swift
//  CoinsCap_MVVM
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    
    var coinsCollection: Variable<[Coin]> {get}

    var webService: WebServiceProtocol {get}
    
    init(webService: WebServiceProtocol)
    
    func getCurrentCoinsCap()
}

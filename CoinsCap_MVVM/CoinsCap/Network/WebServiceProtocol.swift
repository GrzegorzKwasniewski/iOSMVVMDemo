//
//  WebServiceProtocol.swift
//  CoinsCap_MVVM
//

import Foundation

protocol WebServiceProtocol {
    
    func getCoinsData(fromUrl url: String, completion: @escaping ([Coin]?, String?) -> Void)
    
}

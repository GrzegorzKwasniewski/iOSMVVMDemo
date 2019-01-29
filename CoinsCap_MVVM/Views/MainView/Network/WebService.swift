//
//  WebService.swift
//  CoinsCap_MVVM
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol WebServiceProtocol {
    
    init(baseUrl: String)
    
    func getCoinsData(completion: @escaping ([Coin]?, String?) -> Void)
}

final class WebService: WebServiceProtocol {
    
    let baseUrl: String
    
    required init(baseUrl: String = "https://api.coinmarketcap.com/v1/ticker/") {
        self.baseUrl = baseUrl
    }
    
    func getCoinsData(completion: @escaping ([Coin]?, String?) -> Void) {
        
        Alamofire.request(baseUrl).responseArray { (response: DataResponse<[Coin]>) in
            
            switch response.result {
            case .success(let coinsArray):
                
                completion(coinsArray, nil)
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

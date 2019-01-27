//
//  WebService.swift
//  CoinsCap_MVVM
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class WebService: WebServiceProtocol {    
    
    func getCoinsData(fromUrl url: String, completion: @escaping ([Coin]?, String?) -> Void) {
        
        Alamofire.request(url).responseArray { (response: DataResponse<[Coin]>) in
            
            switch response.result {
            case .success(let coinsArray):
                
                for coin in coinsArray {
                    print(coin.coinName)
                }

                completion(coinsArray, nil)
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}

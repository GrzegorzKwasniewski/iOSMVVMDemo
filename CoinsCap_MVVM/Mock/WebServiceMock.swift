

import Foundation

final class WebServiceMock: WebServiceProtocol {
    
    public var simulateServerError = false
    
    let baseUrl: String
    
    required init(baseUrl: String = "https://api.coinmarketcap.com/v1/ticker/") {
        self.baseUrl = baseUrl
    }
    
    func getCoinsData(completion: @escaping ([Coin]?, String?) -> Void) {
            
        if simulateServerError {
            completion(nil, ErrorMessage.server.rawValue)
        } else {
            completion(
                WebServiceMock.crateCoins(),
                nil
            )
        }
    }
    
    public static func crateCoins() -> [Coin] {
        let coin1 = Coin(coinName: "Bitcoin", coinPrice: "20")
        let coin2 = Coin(coinName: "Ethernum", coinPrice: "40")
        
        return [coin1, coin2]
    }
}

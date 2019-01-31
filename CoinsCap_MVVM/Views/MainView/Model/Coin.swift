
import Foundation
import ObjectMapper

struct Coin: ImmutableMappable {
    
    let coinName: String
    let coinPrice: String
    
    init(coinName: String, coinPrice: String) {
        self.coinName = coinName
        self.coinPrice = coinPrice
    }
    
    init(map: Map) throws {
        coinName = (try? map.value("name")) ?? "no data"
        coinPrice = (try? map.value("price_usd")) ?? "no data"
    }
}

extension Coin: Equatable {
    static func == (lhs: Coin, rhs: Coin) -> Bool {
        return lhs.coinName == rhs.coinName && lhs.coinPrice == rhs.coinPrice
    }
}

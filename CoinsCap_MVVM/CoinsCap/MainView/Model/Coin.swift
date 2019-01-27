//
//  Coin.swift
//  CoinsCap_RxSwift
//

import Foundation
import ObjectMapper

struct Coin: ImmutableMappable {
    
    let coinName: String
    let coinPrice: String
    
    init(map: Map) throws {
        coinName = (try? map.value("name")) ?? "no data"
        coinPrice = (try? map.value("price_usd")) ?? "no data"
    }
}

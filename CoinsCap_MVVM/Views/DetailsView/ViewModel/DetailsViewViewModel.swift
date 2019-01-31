
import Foundation

protocol DetailsViewModelProtocol {
    
    init(singleCoin: Coin)
    
    var singleCoin: Coin {get}
}

final class DetailsViewViewModel: DetailsViewModelProtocol {
    
    // MARK: PUBLIC PROPERTIES
    //---------------------------------------------------------------------------
    
    let singleCoin: Coin
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    required init(singleCoin: Coin = Coin()) {
        self.singleCoin = singleCoin
    }
}

import Foundation
import Quick
import Nimble

@testable import CoinsCap_MVVM

class MainViewModelTest: QuickSpec {
    
    override func spec() {
        
        describe("MainViewModelTest") {
            
            context("download coins data from the server without error") {
                
                let webServiceMock = WebServiceMock(baseUrl: "")
                
                let sut = MainViewViewModel(webService: webServiceMock)
                let coinsMock = WebServiceMock.crateCoins()
                let initialCoinValue = sut.coinsCount
                
                sut.getCurrentCoinsCap()
                
                it("should return proper count for coins collection") {
                    expect(sut.coinsCount).to(beGreaterThan(initialCoinValue))
                }
                
                it("should return proper coin object") {
                    expect(sut.getCoin(forRow: 0))
                        .to(equal(coinsMock[0]))
                }
            }
            
            context("download coins data from the server with server error") {

                let webServiceMock = WebServiceMock(baseUrl: "")
                webServiceMock.simulateServerError = true

                let sut = MainViewViewModel(webService: webServiceMock)
                let initialCoinValue = sut.coinsCount

                sut.getCurrentCoinsCap()
                
                it("should return proper count for coins collection") {
                    expect(sut.coinsCount).to(equal(initialCoinValue))
                }
                
                it("should set proper value for error message") {
                    expect(sut.errorMessage.value)
                        .to(equal(ErrorMessage.server.rawValue))
                }

                it("should set not empty value for error message") {
                    expect(sut.errorMessage.value)
                        .toNot(equal(""))
                }
            }
        }
    }
}

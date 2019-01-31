import Foundation
import Quick
import Nimble

@testable import CoinsCap_MVVM


class WebServiceTest: QuickSpec {
    
    override func spec() {
        
        describe("WebService") {
            
            context("get coins data from the server with NO error") {
                
                let validUrl = "http://localhost:1234/androidmvvmdemo/v1/ticker/"
                
                let sut = WebService(baseUrl: validUrl)
                
                waitUntil { done in
                    
                    sut.getCoinsData { (coins, errorMessage) in
                        
                        it("should return proper count for the coins") {
                            expect(coins?.count).to(beGreaterThan(0))
                        }
                        
                        it("should have nil error value") {
                            expect(errorMessage).to(beNil())
                        }
                        
                        done()
                    }
                }
            }
            
            context("get coins data from the server with error") {
                
                let validUrl = "http://localhost:1234/invalid/"
                
                let sut = WebService(baseUrl: validUrl)
                
                waitUntil { done in
                    
                    sut.getCoinsData { (coins, errorMessage) in
                        
                        it("should return proper values") {
                            expect(coins).to(beNil())
                            expect(errorMessage).toNot(beNil())
                        }
                        
                        done()
                    }
                }
            }
        }
    }
}


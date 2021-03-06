//
//  ViewController.swift
//  CoinsCap_RxSwift
//

import UIKit

final class MainViewVC: UIViewController {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    private var mainView = MainView()
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(viewModel: ViewModelProtocol = MainViewViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.mainView = MainView(viewModel: viewModel)
        setUpFullscreenView(mainView: mainView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

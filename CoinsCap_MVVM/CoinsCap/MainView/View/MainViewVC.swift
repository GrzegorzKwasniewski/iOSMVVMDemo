//
//  ViewController.swift
//  CoinsCap_RxSwift
//

import UIKit
import RxSwift
import RxCocoa

class MainViewVC: UITableViewController {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    let mainView = MainView()
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(viewModel: ViewModelProtocol = MainViewViewModel()) {
        super.init(nibName: nil, bundle: nil)
        
        setUpFullscreenView(mainView: mainView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

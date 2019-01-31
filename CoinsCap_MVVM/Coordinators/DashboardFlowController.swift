import UIKit

final class DashboardFlowController: FlowController {
    
    // MARK: NAVIGATION CALLBACKS
    //---------------------------------------------------------------------------
    
    var onFlowFinished: (() -> ())?
    
    // MARK: PRIVATE PROPERTIES
    //---------------------------------------------------------------------------
    
    private var window: UIWindow?
    private var rootViewController: UINavigationController?
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: PUBLIC FUNCTIONS
    //---------------------------------------------------------------------------
    
    func runFlow() {
        showMainView()
    }
    
    func willFinishFlow() {
        rootViewController = nil
        window = nil
    }
    
    // MARK: PRIVATE FUNCTIONS
    //---------------------------------------------------------------------------
    
    private func showMainView() {
        
        let viewModel = MainViewViewModel()
        
        viewModel.onShowSingleCoin = { [weak self] coin in
            self?.showDetailsView(withCoin: coin)
        }
        
        let mainView = MainViewVC(viewModel: viewModel)
        
        self.rootViewController = UINavigationController(rootViewController: mainView)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func showDetailsView(withCoin coin: Coin) {
        
        let viewModel = DetailsViewViewModel(singleCoin: coin)
        
        let detailsView = CoinsDetailsVC(viewModel: viewModel)
        self.rootViewController?.pushViewController(detailsView, animated: true)
    }
}

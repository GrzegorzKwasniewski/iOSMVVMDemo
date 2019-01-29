import UIKit

final class DashboardFlowController: FlowController {
    
    // MARK: NAVIGATION CALLBACKS
    //---------------------------------------------------------------------------
    
    var onFlowFinished: (() -> ())?
    
    // MARK: PRIVATE PROPERTIES
    //---------------------------------------------------------------------------
    
    private let window: UIWindow
    private var rootViewController: UINavigationController!
    private var newsViewController: MainViewVC!
    
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
        // clear resurces
    }
    
    // MARK: PRIVATE FUNCTIONS
    //---------------------------------------------------------------------------
    
    private func showMainView() {
        
        let viewModel = MainViewViewModel()
        
//        viewModel.onSuccessfulLogin = { [weak self] in
//            self?.showRootViewController()
//        }
        
        let mainView = MainViewVC(viewModel: viewModel)
        
        self.rootViewController = UINavigationController(rootViewController: mainView)
        rootViewController.isNavigationBarHidden = true
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

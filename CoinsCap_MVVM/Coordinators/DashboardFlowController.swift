import UIKit

final class DashboardFlowController: FlowController {
    
    private let window: UIWindow
    
    var onFlowFinished: (() -> ())?
    
    // MARK: Private Properties
    
    private var rootViewController: UINavigationController!
    private var newsViewController: MainViewVC!
    
    // MARK: Initializers
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Public Functions
    
    func runFlow() {
        showMainView()
    }
    
    func willFinishFlow() {
        
    }
    
    // MARK: Private Functions
    
    func showMainView() {
        
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


import UIKit

protocol Coordinator {
    func start()
}

protocol FlowController {
    func runFlow()
    func willFinishFlow()
}

final class ApplicationCoordinator: Coordinator {
    
    private let window: UIWindow
    private var rootViewController: UIViewController
    private var dashboardFlowController: DashboardFlowController?
    private var nextViewCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = rootViewController
        startDashboardFlowController()
        window.makeKeyAndVisible()
    }
    
    func startDashboardFlowController() {
        dashboardFlowController = DashboardFlowController(window: window)
        dashboardFlowController?.onFlowFinished = dashboardFlowFinished
        dashboardFlowController?.runFlow()
    }
    
    private func dashboardFlowFinished() {
        dashboardFlowController?.willFinishFlow()
        dashboardFlowController = nil
    }
    
    deinit {
        print("Application Cooridnator is removed")
    }
}

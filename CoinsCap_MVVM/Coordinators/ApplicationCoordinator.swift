
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
    private var dashboardFlowController: DashboardFlowController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        startDashboardFlowController()
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

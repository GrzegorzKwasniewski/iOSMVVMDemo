
import UIKit
import RxSwift
import RxCocoa

final class CoinsDetailsVC: UIViewController {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    private var mainView = CoinsDetailsView()
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(viewModel: DetailsViewModelProtocol = DetailsViewViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.mainView = CoinsDetailsView(viewModel: viewModel)
        setUpFullscreenView(mainView: mainView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

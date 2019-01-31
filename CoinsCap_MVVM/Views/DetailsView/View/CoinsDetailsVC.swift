
import UIKit
import RxSwift
import RxCocoa

final class CoinsDetailsVC: UIViewController {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    let mainView = CoinsDetailsView()
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(viewModel: DetailsViewModelProtocol = DetailsViewViewModel()) {
        super.init(nibName: nil, bundle: nil)
        
        setUpFullscreenView(mainView: mainView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

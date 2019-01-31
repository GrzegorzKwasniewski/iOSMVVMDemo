import UIKit
import SnapKit
import RxSwift

final class CoinsDetailsView: UIView {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    private var coinName = avenirBold(text: "", size: 25, color: Colors.purpleBackground)
    private var coinValue = avenirBold(text: "", size: 22, color: Colors.purpleBackground)
    
    // MARK: VIEW MODEL
    //---------------------------------------------------------------------------
    
    let viewModel: DetailsViewModelProtocol
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(viewModel: DetailsViewModelProtocol = DetailsViewViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        addSubViews()
        addConstraints()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: PRIVATE METHODS
    //---------------------------------------------------------------------------
    
    private func addSubViews() {
        addSubview(coinName)
        addSubview(coinValue)
    }
    
    private func addConstraints() {
        
        coinName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(sketchSizeHeight(80))
            make.left.equalToSuperview().offset(sketchSizeWidth(20))
            make.right.equalToSuperview().offset(sketchSizeWidth(20))
        }
        
        coinValue.snp.makeConstraints { (make) in
            make.top.equalTo(coinName.snp.bottom).offset(sketchSizeHeight(40))
            make.left.equalTo(coinName.snp.left)
            make.right.equalTo(coinName.snp.right)
        }
    }
    
    private func setupUI() {
        coinName.text = viewModel.singleCoin.coinName
        coinValue.text = viewModel.singleCoin.coinPrice
    }
}

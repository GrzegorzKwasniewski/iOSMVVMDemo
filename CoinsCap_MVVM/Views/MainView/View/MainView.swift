
import UIKit
import SnapKit
import RxSwift

final class MainView: UIView {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    private var titleLabel = avenirBold(text: "MVVM Demo", size: 25, color: .white)
    private var coinLabel = avenirBold(text: "Crypto Coins", size: 22, color: .white)
    
    private var topView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = Colors.purpleBackground
        return view
    }()
    
    private lazy var tableView: UITableView = {
        return createTableView(
            delegate: self,
            dataSource: self,
            cellIdentifier: MainViewTableCell.reuseId
        )
    }()
    
    // MARK: PRIVATE PROPERTIES
    //---------------------------------------------------------------------------
    
    private let disposeBag = DisposeBag()
    
    // MARK: VIEW MODEL
    //---------------------------------------------------------------------------
    
    let viewModel: ViewModelProtocol
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    init(viewModel: ViewModelProtocol = MainViewViewModel()) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        bindUI()
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
        addSubview(topView)
        topView.addSubview(titleLabel)
        topView.addSubview(coinLabel)
        addSubview(tableView)
    }
    
    private func addConstraints() {
        
        topView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(sketchSizeHeight(120))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(sketchSizeHeight(30))
            make.left.equalToSuperview().offset(sketchSizeWidth(10))
            make.right.equalToSuperview().offset(-sketchSizeWidth(10))
        }
        
        coinLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(sketchSizeHeight(10))
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.bottom.equalToSuperview()
        }
    }
    
    private func bindUI() {
        viewModel.coinsCollection.asDriver(onErrorJustReturn: [Coin]())
            .drive(onNext: { [weak self] _ in
                self?.updateUIWithCoins()
            }).disposed(by: disposeBag)
        
        viewModel.errorMessage.asDriver(onErrorJustReturn: "")
            .drive(onNext: { [weak self] message in
                self?.rootVC?.showErrorMessage(message: message)
            }).disposed(by: disposeBag)
        
        viewModel.getCurrentCoinsCap()
    }
    
    private func setupUI() {
        backgroundColor = .white
        tableView.refreshControl?.addTarget(
            self,
            action: #selector(refreshCoins),
            for: .valueChanged
        )
    }
    
    private func updateUIWithCoins() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
    
    @objc private func refreshCoins() {
        viewModel.getCurrentCoinsCap()
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainViewTableCell.reuseId) as? MainViewTableCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(coin: viewModel.getCoin(forRow: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(sketchSizeHeight(80))
    }
}

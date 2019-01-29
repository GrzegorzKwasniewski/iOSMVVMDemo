
import UIKit
import SnapKit
import RxSwift

final class MainView: UIView {
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    private var titleLabel: UILabel = {
        return avenirBold(text: "MVVM Demo", size: 25)
    }()
    
    private var coinLabel: UILabel = {
        return avenirBold(text: "Coin", size: 25)
    }()
    
    private lazy var tableView: UITableView = {
        return createTableView(
            delegate: self,
            dataSource: self,
            cellIdentifier: "MainViewTableCell"
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
        addSubview(titleLabel)
        addSubview(coinLabel)
        addSubview(tableView)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(sketchSizeWidth(10))
            make.right.equalToSuperview().offset(-sketchSizeWidth(10))
        }
        
        coinLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(sketchSizeHeight(10))
            make.left.equalToSuperview().offset(sketchSizeWidth(10))
            make.right.equalToSuperview().offset(-sketchSizeWidth(10))
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(coinLabel.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func bindUI() {
        viewModel.coinsCollection.asDriver()
            .drive(onNext: { [weak self] _ in self?.updateUIWithCoins() })
            .disposed(by: disposeBag)
        
        viewModel.getCurrentCoinsCap()
    }
    
    private func setupUI() {
        tableView.refreshControl?.addTarget(
            self,
            action: #selector(refreshCoins),
            for: .valueChanged
        )
    }
    
    private func updateUIWithCoins() {
        tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
    
    @objc private func refreshCoins() {
        self.viewModel.getCurrentCoinsCap()
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let coin = viewModel.getCoin(forRow: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = coin.coinName
        cell.detailTextLabel?.text = coin.coinPrice
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}

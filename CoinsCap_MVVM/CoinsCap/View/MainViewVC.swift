//
//  ViewController.swift
//  CoinsCap_RxSwift
//

import UIKit
import RxSwift
import RxCocoa

class MainViewVC: UITableViewController {
    
    // UI Views
    
    @IBOutlet weak var coinLabel: UILabel!
    
    // RxSwift Properties
    
    let disposeBag = DisposeBag()
    
    // ViewModel
    
    let viewModel: ViewModelProtocol
    
    // Initializers
    
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = MainViewViewModel(webService: WebService())
        super.init(coder: aDecoder)
    }
    
    // View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        viewModel.coinsCollection.asDriver()
            .drive(onNext: { [weak self] _ in self?.updateUIWithCoins() })
            .disposed(by: disposeBag)
        
        viewModel.getCurrentCoinsCap()
        
    }
    
    // Custom Functions
    
    func setupUI() {
        title = "Coins Market Cap"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupRefreshControll()
    }
    
    func setupRefreshControll() {
        
        self.refreshControl = UIRefreshControl()
        let refreshControl = self.refreshControl!
        
        refreshControl.backgroundColor = .white
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshCoins), for: .valueChanged)
        
    }
    
    func updateUIWithCoins() {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    @objc func refreshCoins() {
        self.viewModel.getCurrentCoinsCap()
    }
}

extension MainViewVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinsCollection.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let coin = viewModel.coinsCollection.value[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = coin.coinName
        cell.detailTextLabel?.text = coin.coinPrice

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let coin = viewModel.coinsCollection.value[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let coinsDetailsVC = storyboard.instantiateViewController(withIdentifier: "CoinsDetailsVC") as? CoinsDetailsVC else { return }
        
        coinsDetailsVC.singleCoin = coin
        
        navigationController?.pushViewController(coinsDetailsVC, animated: true)
        
    }
}

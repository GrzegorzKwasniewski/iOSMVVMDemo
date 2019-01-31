
import UIKit
import SnapKit

extension UIViewController {
    func setUpFullscreenView(mainView: UIView) {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    func showErrorMessage(message: String) {
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

func avenirBold(text: String, size: CGFloat, color: UIColor = Colors.darkGreyText) -> UILabel {
    let label = UILabel()
    label.text = text.localized
    label.textAlignment = .left
    label.font = Fonts.avenirBold.withSize(size)
    label.textColor = color
    return label
}

func createTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, cellIdentifier: String) -> UITableView {
    
    let tableView = UITableView()
    tableView.backgroundColor = .white
    tableView.delegate = delegate
    tableView.dataSource = dataSource
    tableView.sectionIndexBackgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.alwaysBounceVertical = false
    tableView.separatorStyle = .none
    
    tableView.refreshControl = UIRefreshControl()
    tableView.refreshControl?.backgroundColor = .white
    tableView.refreshControl?.tintColor = Colors.darkGreyText
    tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh".localized)
    
    switch cellIdentifier {
    case "MainViewTableCell":
        tableView.register(MainViewTableCell.self, forCellReuseIdentifier: cellIdentifier)
    default:
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    return tableView
}

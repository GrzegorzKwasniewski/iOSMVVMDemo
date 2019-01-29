
import UIKit
import SnapKit

extension UIViewController {
    func setUpFullscreenView(mainView: UIView) {
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
}

func avenirBold(text: String, size: CGFloat) -> UILabel {
    let label = UILabel()
    label.text = text.localized
    label.textAlignment = .left
    label.font = Fonts.avenirBold.withSize(size)
    label.textColor = Colors.darkGreyText
    return label
}

func createTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, cellIdentifier: String) -> UITableView {
    
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.delegate = delegate
    tableView.dataSource = dataSource
    tableView.sectionIndexBackgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.alwaysBounceVertical = false
    tableView.separatorStyle = .none
    tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.clipsToBounds = false
    
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

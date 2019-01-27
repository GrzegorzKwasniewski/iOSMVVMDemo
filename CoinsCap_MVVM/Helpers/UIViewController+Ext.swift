
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

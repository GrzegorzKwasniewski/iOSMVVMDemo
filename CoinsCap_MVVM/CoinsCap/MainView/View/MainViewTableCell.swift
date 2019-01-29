//
//  MainViewTableCell.swift
//  MR
//

import UIKit
import SnapKit

class MainViewTableCell: UITableViewCell {
    
    public static let reuseId = "MainViewTableCell"
    
    // MARK: UI
    //---------------------------------------------------------------------------
    
    private var titleLabel: UILabel = {
        return avenirBold(text: "", size: 15)
    }()
    
    private var subtitleLabel: UILabel = {
        return avenirBold(text: "", size: 10)
    }()
    
    // MARK: INITIALIZERS
    //---------------------------------------------------------------------------
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        addConstraints()
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: PUBLIC METHODS
    //---------------------------------------------------------------------------
    
    func configureCell(coin: Coin) {
        titleLabel.text = coin.coinName
        subtitleLabel.text = coin.coinPrice
    }
    
    // MARK: PRIVATE METHODS
    //---------------------------------------------------------------------------
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(sketchSizeHeight(10))
            make.left.equalToSuperview().offset(sketchSizeWidth(10))
            make.right.equalToSuperview().offset(-sketchSizeWidth(10))
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(sketchSizeHeight(20))
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
        }
    }
    
    private func setupView() {
        backgroundColor = .clear
    }
}

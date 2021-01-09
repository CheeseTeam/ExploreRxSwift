//
//  NormalCell.swift
//  ExRxSwift
//
//  Created by muhlenXi on 2018/9/14.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit
import RxSwift

class NormalCell: UITableViewCell {
    
    let scoreBtn = UIButton()
    var bag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 清除 cell 的数据，避免复用带来异常错误
        bag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private method
    func setupSubviews() {
        scoreBtn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
        scoreBtn.setTitle("cell tap me", for: .normal)
        scoreBtn.setTitleColor(UIColor.blue, for: .normal)
        self.contentView.addSubview(scoreBtn)
    }
}

//
//  ViewController.swift
//  ExRxSwift
//
//  Created by muhlenXi on 2018/7/2.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum TestError: Error {
    case somethingWrong
}

class ViewController: UIViewController {
    let bag = DisposeBag()
    let button = UIButton()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.lightGray
        table.tableFooterView = UIView()
        table.estimatedRowHeight = 0
        table.estimatedSectionHeaderHeight = 0
        table.estimatedSectionFooterHeight = 0
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        button.setTitle("tap me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        self.view.addSubview(button)
        
        button.rx.controlEvent(.touchUpInside).subscribe(onNext: { (next) in
            print("next")
        }).disposed(by: bag)
        
        tableView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 200)
        tableView.register(NormalCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        
        print(UIScreen.main.bounds.size)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: UITableViewDataSource / UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NormalCell
        cell.scoreBtn.rx.controlEvent(.touchUpInside).subscribe(onNext: { (next) in
            print("tap cell score btn")
        }).disposed(by: cell.bag)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
    
}



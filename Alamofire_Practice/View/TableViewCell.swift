//
//  TableViewCell.swift
//  Alamofire_Practice
//
//  Created by 황홍필 on 2023/05/19.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    

    let source: UILabel = {
        let source = UILabel()
        return source
    }()
    
    
    let idNumber: UILabel = {
        let idNumber = UILabel()
        return idNumber
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.addSubview(source)
        self.addSubview(idNumber)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupLayout() {
        source.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(10)
            make.top.equalTo(self.snp.top).offset(10)
        }
        
        
        idNumber.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.top.equalTo(self.snp.top).offset(10)
        }
    }

}

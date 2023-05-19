//
//  ViewController.swift
//  Alamofire_Practice
//
//  Created by 황홍필 on 2023/05/19.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    
    let tableView = UITableView()
    
    var dataSuccess: AlamofirePractice = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupLayout()
        setupDelegate()
        registerTableView()
        setupNetworkData()
        print("됐으면 된다고 말좀 해라 좀")
        
    }
    
    
    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(0)
            make.top.equalTo(view.snp.top).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
    
    
    func setupDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func registerTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    func setupNetworkData() {
        let url = "https://finnhub.io/api/v1/company-news?symbol=AAPL&from=2023-05-17&to=2023-05-19&token=cficbc9r01qq9nt20eagcficbc9r01qq9nt20eb0"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .responseDecodable(of: AlamofirePractice.self) { response in
            switch response.result {
            case .success(let data):
                self.dataSuccess = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
        
        
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataSuccess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        
        
        
        cell.source.text = dataSuccess[indexPath.row].source
        cell.idNumber.text = "\(dataSuccess[indexPath.row].id)"
        
        
        return cell
    }
    
    
}


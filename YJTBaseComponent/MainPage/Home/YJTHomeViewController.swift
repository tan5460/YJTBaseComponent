//
//  YJTHomeViewController.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/17.
//

import UIKit

class YJTHomeViewController: YJTBaseViewController {
    
    private var tableView: UITableView!
    private var classList = [YJTCoverTestViewController.self]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo"
        view.backgroundColor = .lightGray
        createViews()
    }
    
    private func createViews() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.snp_makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    

}

extension YJTHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classType = classList[indexPath.row]
        let vc = classType.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.selectionStyle = .none
        let classType = classList[indexPath.row]
        cell.textLabel?.text = classType.description()
        return cell
    }
}

//
//  ViewController.swift
//  DemoRefreshControl
//
//  Created by Ravi Kiran HR on 12/04/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var datasource = [String]()
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing!")
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        refreshControl.tintColor = .red
        tblView.addSubview(refreshControl)
        for i in 0..<20 {
            datasource.append("This is a demo cell:\(i)")
        }
    }
    
    @objc func refreshTable() {
        datasource.removeAll()
        for i in 100..<120 {
            datasource.append("This is a demo cell:\(i * index)")
        }
        refreshControl.endRefreshing()

        tblView.reloadData()
        index += 1
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "democell")
        var content = UIListContentConfiguration.cell()
        content.text = datasource[indexPath.row]
        cell?.contentConfiguration = content
        return cell!
    }
    
}

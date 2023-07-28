//
//  CustomTableViewController.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/28.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    let todo = ToDoInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 90
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let row = todo.list[indexPath.row]
        
        // row를 인자로 넘겨 코드를 조금 더 간결하게 작성하자.
        cell.configureCell(row: row)
        
        return cell
        
    }
    
    // 3. 셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

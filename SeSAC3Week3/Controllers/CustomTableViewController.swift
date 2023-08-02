//
//  CustomTableViewController.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/28.
//

import UIKit

/*
 1. 파티를 막자
 2. sender.tag
 3. 데이터
 */

class CustomTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var todo = ToDoInformation() {
        didSet { // 변수가 달리짐을 감지!
            print("DidSet이 뭘까?")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 90
        
        searchBar.placeholder = "할 일을 입력해보세요."
        searchBar.searchTextField.addTarget(self, action: #selector(searchBarReturnTapped), for: .editingDidEndOnExit)
    }
    
    @objc
    func searchBarReturnTapped() {
        //ToDo 항목을
        let data = ToDo(main: searchBar.text!, sub: "23.08.01", like: false, done: false, color: ToDoInformation.randomBackgroundColor())
        
        //list에 추가
        todo.list.insert(data, at: 0)
        
        searchBar.text = nil
        
        //갱신
//        tableView.reloadData()
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
        
        //IBAction으로 연결시 모든 버튼이 클릭될 수 있다.
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
//        cell.selectionStyle = .none
        
        return cell
        
    }
    
    @objc
    func likeButtonClicked(_ sender: UIButton) {
        print("\(sender.tag) clicked")
        todo.list[sender.tag].like.toggle()
        
//        tableView.reloadData()
    }
    
    // 3. 셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        todo.list[indexPath.row].done.toggle()
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        
        vc.data = todo.list[indexPath.row]
        
        present(vc, animated: true)
        
//        tableView.reloadData()
        //선택한 셀만 갱신!
        tableView.reloadRows(at: [indexPath], with: .none)
//        tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
        
    }
    
    // 삭제
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //제거 -> 갱신
        todo.list.remove(at: indexPath.row)
//        tableView.reloadData()
    }

}

//
//  TodoTableViewController.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/27.
//

import UIKit

class TodoTableViewController: UITableViewController {

    @IBOutlet var labelTextField: UITextField!
    @IBOutlet var addButton2: UIButton!
    
    var list = ["장보기", "영화보기", "잠자기", "코드보기", "헬스하기", "축구하기", "과제하기", "복습하기", "쉬기", "쉬기", "쉬기", "쉬기", "쉬기", "쉬기", "쉬기", "쉬기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        
        showAlert()
        
        //1. list에 요소 추가
        list.append("밥하기")
        print(list)
        //2. 테이블뷰 갱신
        tableView.reloadData()
    }
    
    @IBAction func addButton2Clicked(_ sender: UIButton) {
        if let text = labelTextField.text {
            list.append(text)
        }
        tableView.reloadData()
        
    }
    
    
    //1. 섹션 내 셀의 갯수: 카톡 친구 수 만큼 셀 객수가 필요해 라고 iOS에게 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    //2. 셀 디자인 및 데이터 처리: 카톡 프로필 모서리 둥글게, 프로필 이미지와 상태 메시지 반영 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Identifier 는 인터페이스 빌더에서 설정!
        //재사용 메커니즘
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else {
            return UITableViewCell()
        }
    
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .white
        
        cell.textLabel?.text = list[indexPath.row]
        
        cell.textLabel?.configureTitleText()
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .blue
        cell.detailTextLabel?.font = .systemFont(ofSize: 15)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    
    //3. 셀의 높이: 보여주고자 하는 셀의 높이를 설정 / default = 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}


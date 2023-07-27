//
//  StudyViewController.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/27.
//

import UIKit

class StudyTableViewController: UITableViewController {

    let mancityLineUp = ["에데르송", "아칸지", "디아스", "스톤스", "워커", "로드리", "귄도안", "덕배", "그릴리쉬", "베실바", "홀란드"]
    let mancityBench = ["포든", "마레즈", "칸셀루", "알바레즈", "라포르테", "아케", "필립스", "코바치치", "오르테가"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "첫번째 섹션" : "두번째 섹션"
    }
    
    //1. 셀 갯수 (필수)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? mancityLineUp.count : mancityBench.count
    }
    
    //2. 셀 데이터 및 디자인 처리 (필수)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Identifier에 맞는 셀이 없을 수도 있기 때문에 옵셔널로 반환해준다. -> 해제가 필요하다.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(indexPath.row + 1) 위치에 \(mancityLineUp[indexPath.row]) 선수가 있습니다."
        } else {
            cell.textLabel?.text = "\(indexPath.row + 1) 위치에 \(mancityBench[indexPath.row]) 선수가 있습니다."
        }
        
        return cell
    }

    //3. 셀 높이: 서비스 구현에 따라 필요한 경우가 많지만, 항상 같은 높이를 셀에서 사용한다면 비효율적일 수 있다.
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    
}

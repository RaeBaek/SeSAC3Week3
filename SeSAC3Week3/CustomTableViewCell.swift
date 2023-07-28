//
//  CustomTableViewCell.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    @IBOutlet var backView: UIView!
    @IBOutlet var checkboxImageView: UIImageView!
    
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    // Cell UI를 구성하는 함수
    func configureCell(row: ToDo) {
        
        mainTitleLabel.text = row.main
        subTitleLabel.text = row.sub
        
        checkboxImageView.image = row.done == true ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        
        if row.like {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
}

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitleLabel.font = .boldSystemFont(ofSize: 17)
        mainTitleLabel.textColor = .blue
    }
    
    // static func -> ovverride class
    override class func awakeFromNib() {
        <#code#>
    }
    
    // Cell UI를 구성하는 함수
    func configureCell(row: ToDo) {
        backView.backgroundColor = row.color
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

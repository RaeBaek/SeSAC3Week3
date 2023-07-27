//
//  Extension.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/27.
//

import UIKit

extension UITableViewController {
    func showAlert() {
        let alert = UIAlertController(title: "주의!", message: "주의하세요!", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

extension UILabel {
    func configureTitleText() {
        self.textColor = .red
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .center
    }
}

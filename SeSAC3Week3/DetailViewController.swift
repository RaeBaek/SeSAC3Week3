//
//  DetailViewController.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/08/02.
//

import UIKit

class DetailViewController: UIViewController {

    //1.
    var data: ToDo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = data else {
            return
        }
        print(data)
    }

}

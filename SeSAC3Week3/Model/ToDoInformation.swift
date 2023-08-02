//
//  ToDoInformation.swift
//  SeSAC3Week3
//
//  Created by 백래훈 on 2023/07/28.
//

import UIKit

struct ToDoInformation {
    
    // 타입 메서드는 인스턴스 생성과 상관없이 사용 가능!
    // default하게 lazy하게 동작한다!
    static func randomBackgroundColor() -> UIColor {
        
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    // 인스턴스 프로퍼티
    var list = [ToDo(main: "헬스하기", sub: "23.07.28", like: true, done: true, color: randomBackgroundColor()),
                ToDo(main: "영화보기", sub: "23.07.29", like: false, done: false, color: randomBackgroundColor()),
                ToDo(main: "축구하기", sub: "23.07.30", like: true, done: false, color: randomBackgroundColor())]
}

//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by monk773 on 2017. 10. 18..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // initTitle()
        initTitleNew()
    }
    
    func initTitle() {
        
        // 방법 1. 단순히 레이블 객체 하나를 이용해서 두 줄로 표현
        // 1. 네비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // 2. 속성 설정
        nTitle.numberOfLines = 2    // 2줄로 설정
        nTitle.textAlignment = .center  // 가운데 정렬
        nTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        // 3. 네비게이션 타이틀에 입력
        navigationItem.titleView = nTitle
        
        // 4. 배경 색상 설정
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitleNew() {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center  // 가운데 정렬
        topTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        topTitle.textColor = UIColor.white
        topTitle.text = "58개 숙소"
        
        let subTitle = UILabel(frame: CGRect(x: 0, y: topTitle.frame.origin.y + topTitle.frame.height, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center  // 가운데 정렬
        subTitle.font = UIFont.systemFont(ofSize: 12) // 폰트 크기
        subTitle.textColor = UIColor.white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        navigationItem.titleView = containerView
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = color
    }
    
}


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
        
        // 두줄 타이틀 만들기
        // initTitle() // 1. 단순 방법 ( 변화도 낮음 )
        // initTitleNew() // 2. 복잡 방법 ( 변화도 높음 )
        
        // 이미지 표현하기
        // initTitleImage()
        
        // 텍스트필드 사용하기
        initTitleInput()
    }
    
    func initTitleInput() {
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = UIColor.white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocapitalizationType = .none   // 자동 대문자 변환 속성 사용 안함
        tf.autocorrectionType = .no // 자동 입력 기능 해제
        tf.spellCheckingType = .no  // 스펠링 체크 기능 해제
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        navigationItem.titleView = tf
    }
    
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        navigationItem.titleView = imageV
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


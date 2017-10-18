//
//  ControlViewController.swift
//  CustomNavigationBar
//
//  Created by monk773 on 2017. 10. 18..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {

    // 1.  슬라이더 객체 정의
    let slider = UISlider()
    
    var sliderValue: Float {
        return slider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        // 슬라이더 영역과 크기 정의, 루트 뷰 추가
        slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        view.addSubview(slider)
        preferredContentSize = CGSize(width: slider.frame.width, height: slider.frame.height + 10)
    }
}

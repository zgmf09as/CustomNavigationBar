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
        
        // 텍스트필드 사용하기, 아이템 영역 커스터마이징
        // initTitleInput()
        
        // 크롬 브라우저 UI 흉내내기
        initTitleCrome()
        
        // Test Alert
        // setAlert()
        
        setCallAlertButton()
    }
    
    func setCallAlertButton() {
        let alertMapBtn = UIButton(type: .system)
        
        alertMapBtn.frame = CGRect(x: 0, y: 150, width: 100, height:30)
        alertMapBtn.center.x = view.frame.width/2 - 50
        alertMapBtn.setTitle("Map Alert", for: .normal)
        alertMapBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        view.addSubview(alertMapBtn)
        
        let alertImageBtn = UIButton(type: .system)
        
        alertImageBtn.frame = CGRect(x: 0, y: 150, width: 100, height:30)
        alertImageBtn.center.x = view.frame.width/2 + 50
        alertImageBtn.setTitle("Image Alert", for: .normal)
        alertImageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        view.addSubview(alertImageBtn)
        
        let alertSliderBtn = UIButton(type: .system)

        alertSliderBtn.frame = CGRect(x: alertMapBtn.frame.origin.x, y: 250, width: 100, height:30)
        alertSliderBtn.setTitle("Slider Alert", for: .normal)
        alertSliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        view.addSubview(alertSliderBtn)
        
        let alertListBtn = UIButton(type: .system)
        
        alertListBtn.frame = CGRect(x: alertImageBtn.frame.origin.x, y: 250, width: 100, height:30)
        alertListBtn.setTitle("List Alert", for: .normal)
        alertListBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        view.addSubview(alertListBtn)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print(">>> 선택된 행은 \(indexPath.row) 입니다.")
    }
    
    @objc func listAlert(_ sender: UIButton) {
        // 콘텐츠 영역에 들어갈 뷰 컨트롤러 생성 및 등록
        let contentVC = ListViewController()
        contentVC.delegate = self
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    @objc func sliderAlert(_ sender: UIButton) {

        // 콘텐츠 영역에 들어갈 뷰 컨트롤러 생성 및 등록
        let contentVC = ControlViewController()
        
        let alert = UIAlertController(title: nil, message: "밝기를 설정해 주세요", preferredStyle: .alert)
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            print(">>> sliderValue = \(contentVC.sliderValue)")
        })
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    @objc func imageAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        // 콘텐츠 영역에 들어갈 뷰 컨트롤러 생성 및 등록
        let contentVC = ImageViewController()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        present(alert, animated: true)
    }
    
    @objc func mapAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        // 콘텐츠 영역에 들어갈 뷰 컨트롤러 생성 및 등록
        let contentVC = MapKitViewController()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        present(alert, animated: true)
    }
    
    func setAlert() {
        let alert = UIAlertController(title: "Title Alert", message: "기본 메시지가 들어가는 곳", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        let v = UIViewController()
        v.view.backgroundColor = UIColor.red
        alert.setValue(v, forKey: "contentViewController")
        
        present(alert, animated: true)
    }
    
    func initTitleCrome() {
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
        
        // left item area
        let back = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftItem
        
        // right item area
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        cnt.layer.cornerRadius = 3
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        cnt.layoutMargins.right = CGFloat(20.0)
        
        rv.addSubview(cnt)
        
        let more = UIButton(type:.system)
        more.frame = CGRect(x: cnt.frame.origin.x + cnt.frame.width + cnt.layoutMargins.right, y:10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        
        rv.addSubview(more)
        
        let rightItem = UIBarButtonItem(customView: rv)
        navigationItem.rightBarButtonItem = rightItem
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
        
        // left item area
        let lv = UIView()
        lv.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
        lv.backgroundColor = UIColor.red
        
        let leftItem = UIBarButtonItem(customView: lv)
        navigationItem.leftBarButtonItem = leftItem
        
        // right item area
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
        rv.backgroundColor = UIColor.brown
        
        let rightItem = UIBarButtonItem(customView: rv)
        navigationItem.rightBarButtonItem = rightItem
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


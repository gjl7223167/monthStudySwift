//
//  ViewController.swift
//  MonthSwift
//
//  Created by MaYiKe on 2019/8/26.
//  Copyright © 2019 GG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    var vcAry = NSMutableArray.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vcAry.add(OneViewController())
        vcAry.add(TwoViewController())
        
        self.createBtn()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
  
    
    func createBtn() {
        let widthBtn = (WIDTH-(22 * 5)) / 4.0
        let heightBtn = widthBtn * 0.8
        let countJ =  floorf(Float(vcAry.count / 4))
        var currentDay:NSInteger = 0
        for i in 0...NSInteger(countJ){
            for j in 0 ..< 4{
                currentDay+=1
                let intI = CGFloat(i)
                let intj = CGFloat(j)
                let intX = 22 + CGFloat(widthBtn) * intj + 22 * intj
                let intY = 100 + heightBtn * intI + 22 * intI
                
                let clickBtn = UIButton.init(frame: CGRect.init(x: intX , y:intY , width:  widthBtn, height: heightBtn ))
                clickBtn.setTitle("第 \(currentDay) 天", for: UIControl.State.normal)
                clickBtn.titleLabel?.font=UIFont.systemFont(ofSize: 12)
                clickBtn.tag = currentDay
                clickBtn.addTarget(self, action: #selector(clickDayBtn(button:)), for: UIControl.Event.touchUpInside)
                clickBtn.backgroundColor = UIColor.gray
                clickBtn.layer.masksToBounds = false
                clickBtn.layer.cornerRadius = 3.0
                
                self.view.addSubview(clickBtn)
            }
        }
    }
    @objc func clickDayBtn(button:UIButton) {
        
        self.navigationController?.pushViewController(vcAry.object(at: button.tag-1) as! UIViewController, animated: false)
        
    }
    
}





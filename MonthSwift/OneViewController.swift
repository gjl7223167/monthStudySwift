//
//  OneViewController.swift
//  MonthSwift
//
//  Created by MaYiKe on 2019/8/26.
//  Copyright © 2019 GG. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    var playbtn = UIButton()
    var pauseBtn = UIButton()
    var timeLabel = UILabel()
    var resetBtn = UIButton()
    
    var timer = Timer()
    
    var counter = 0.0
    var isPlaying = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "秒表"
        // Do any additional setup after loading the view.
        self.title="秒表"
        self.creatBtn()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    
    
    func creatBtn() {
        let leftView = UIView.init(frame: CGRect.init(x: 0, y: 400*pix, width: 375*pix, height: HEIGHT-400*pix))
        leftView.backgroundColor = UIColor.green
        self.view.addSubview(leftView)
        
        
        let rightView = UIView.init(frame: CGRect.init(x: 357*pix, y: 400*pix, width: 375*pix, height: HEIGHT-400*pix))
        rightView.backgroundColor = UIColor.blue
        self.view.addSubview(rightView)
        
        playbtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80*pix, height: 80*pix))
        
        playbtn.center = CGPoint.init(x: leftView.center.x, y: leftView.center.y)
        playbtn.setBackgroundImage(UIImage.init(named: "play"), for: UIControl.State.normal)
        playbtn.addTarget(self, action: #selector(self.playBtnTouch), for: UIControl.Event.touchUpInside)
        self.view.addSubview(playbtn)
        
        
        pauseBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80*pix, height: 80*pix))
        pauseBtn.center = CGPoint.init(x: rightView.center.x, y: rightView.center.y)
        pauseBtn.setBackgroundImage(UIImage.init(named: "pause"), for: UIControl.State.normal)
        pauseBtn.addTarget(self, action: #selector(self.pauseBtnYouch), for: UIControl.Event.touchUpInside)
        self.view.addSubview(pauseBtn)
        
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 22*pix, y: 200*pix, width: 100*pix, height: 100*pix))
        
        timeLabel.font = UIFont.systemFont(ofSize: 60*pix)
        timeLabel.text = "0.0"
        timeLabel.textColor = UIColor.white
        timeLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(timeLabel)
        
        
        resetBtn = UIButton.init(frame: CGRect.init(x: 500*pix, y:200*pix , width: 200*pix, height: 100*pix))
        resetBtn.setTitle("重置", for: UIControl.State.normal)
        resetBtn.backgroundColor=UIColor.gray
        resetBtn.center.y=timeLabel.center.y
        resetBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        resetBtn.addTarget(self, action: #selector(self.resetBtnTouch), for: UIControl.Event.touchUpInside)
        resetBtn.layer.masksToBounds = false
        resetBtn.layer.cornerRadius = 3.0
        self.view.addSubview(resetBtn)
        
        
        
    }
    
    
    
    @objc func playBtnTouch() {
        if isPlaying {
            return
        }
        isPlaying = true
        playbtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timeClick), userInfo: nil, repeats: true)
    }
    
    @objc func pauseBtnYouch() {
        playbtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
        
        
    }
    
    @objc func resetBtnTouch() {
        isPlaying = false
        counter = 0.0
        timeLabel.text = "0.0"
        timer.invalidate()
        pauseBtn.isEnabled = true
        playbtn.isEnabled = true
    }
    
    @objc func timeClick() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

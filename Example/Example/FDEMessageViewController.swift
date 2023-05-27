//
//  FDEMessageViewController.swift
//  Example
//
//  Created by xq on 2022/9/30.
//

import UIKit
import GCDWeakTimer

class FDEMessageViewController: FDEBaseViewController {

    lazy var btn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.setTitle("button", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnDidClicked(_:)), for: .touchUpInside)
        return btn
    }()

    var timer: GCDWeakTimer!
    var count: Int = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSubview()
        
        self.timer = GCDWeakTimer.init(timeInterval: 1, target: self, selector: #selector(timerFired(_:)), userInfo: nil, repeats: true, dispatchQueue: nil)
        
        DLog("初始化定时器")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
            DLog("启动定时器--\(self.count)")
            self.timer.start()
        })
    }
    
    @objc func timerFired(_ sender: GCDWeakTimer) {
        count -= 1
        DLog("timerFired--\(count)")
        if count <= 0 {
            timer.invalidate()
            count = 30
            DLog("停止定时器")
            return
        }
    }

    func setupSubview() {
        self.navigationItem.title = "消息"
        view.addSubview(btn)
        btn.center = self.view.center
    }

    @objc func btnDidClicked(_ sender: UIButton) {
        DLog("btnDidClicked")
        DLog("启动定时器--\(count)")
        timer.start()
    }


}


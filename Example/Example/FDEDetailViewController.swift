//
//  FDEDetailViewController.swift
//  Example
//
//  Created by xq on 2022/9/30.
//

import UIKit
import GCDWeakTimer

class FDEDetailViewController: FDEBaseViewController {
    lazy var startBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.setTitle("startBtn", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(startBtnDidClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var stopBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.setTitle("stopBtn", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(stopBtnDidClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var suspendBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.setTitle("suspendBtn", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(suspendBtnDidClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var resumeBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.setTitle("resumeBtn", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(resumeBtnDidClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    var timer: GCDWeakTimer!
    
    var queue = DispatchQueue.init(label: "myqueue", attributes: DispatchQueue.Attributes.concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timer = GCDWeakTimer.init(timeInterval: 1, target: self, selector: #selector(timerFired(_:)), userInfo: nil, repeats: true, dispatchQueue: self.queue)
        
        self.view.addSubview(self.startBtn)
        self.view.addSubview(self.stopBtn)
        self.view.addSubview(self.suspendBtn)
        self.view.addSubview(self.resumeBtn)
        
        self.startBtn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 44)
        self.stopBtn.frame = CGRect.init(x: 100, y: 200, width: 100, height: 44)
        self.suspendBtn.frame = CGRect.init(x: 100, y: 300, width: 100, height: 44)
        self.resumeBtn.frame = CGRect.init(x: 100, y: 400, width: 100, height: 44)
    }
    
    @objc func timerFired(_ sender: GCDWeakTimer) {
        DLog("timerFired--线程：\(Thread.current)")
    }

    @objc func startBtnDidClicked(_ sender: UIButton) {
        DLog("startBtnDidClicked")
        for _ in 0..<10 {
            DispatchQueue.global().async {
                sleep(arc4random() % 5)
                self.timer.start()
            }
        }
    }
    
    @objc func stopBtnDidClicked(_ sender: UIButton) {
        DLog("stopBtnDidClicked")
    
        for _ in 0..<3 {
            DispatchQueue.global().async {
                sleep(arc4random() % 3)
                self.timer.invalidate()
            }
        }
    }
    
    @objc func suspendBtnDidClicked(_ sender: UIButton) {
        DLog("suspendBtnDidClicked")
        self.timer.suspend()
    }
    
    @objc func resumeBtnDidClicked(_ sender: UIButton) {
        DLog("resumeBtnDidClicked")
        self.queue.async {
            self.timer.resume()
        }
    }
}


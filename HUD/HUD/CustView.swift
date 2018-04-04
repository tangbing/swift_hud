
//
//  CustView.swift
//  HUD
//
//  Created by Tb on 2018/4/4.
//  Copyright © 2018年 Tb. All rights reserved.
//

import UIKit

class CustView: UIView {
    // 活动指示器
    var activity: UIActivityIndicatorView!
    // 添加一个透明的VIew
    var activityView: UIView!
    
    var durationF: Double = 0.0
    
    
    let screenW = UIScreen.main.bounds.size.width
    let screenH = UIScreen.main.bounds.size.height
    

    // MARK: - 网络提示
    func initWithIndicatorWithView(view: UIView, textMsg: String)
    {
        activityView = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: screenH))
        activityView.backgroundColor = UIColor.clear
        
        // 配置
        self.frame = CGRect(x: view.bounds.size.width/2 - 120/2, y: view.bounds.size.height/2 - 90/2, width: 120, height: 90)
        self.backgroundColor = UIColor.lightGray
        self.alpha = 0
            //UIColor.init(white: 0, alpha: 0)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.alpha = 0
        
        activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.center = CGPoint(x: 60, y: 30)
        activityView.addSubview(activity)
        self.addSubview(activity)
        
        let label = UILabel(frame: CGRect(x: 0, y: 50, width: 120, height: 30))
        label.text = textMsg
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = UIColor.red
        self.addSubview(label)
        
        activityView.addSubview(self)
        view.addSubview(activityView)
        activityView.isHidden = true
        
    }
        
        func startTheView(){
            activityView.isHidden = false
            activity.startAnimating()
            weak var weakself = self
            UIView.animate(withDuration: 0.3) {
                weakself?.alpha = 1
            }
        }
        
        func stopAndRemoveFromSuperView(){
            activityView.isHidden = true
            activity.stopAnimating()
            
            weak var weakself = self
            
            UIView.animate(withDuration: 0.3, animations: {
                weakself?.alpha = 0
            }) { (finish) in
               weakself?.activityView.isHidden = true
                weakself?.removeFromSuperview()
            }
        }
    
    func initWithView(view: UIView, textMsg: String, duration: Double) {
        print(textMsg)
        durationF = duration
        // 适配高度
        
        let size: CGRect = textMsg.boundingRect(with: CGSize(width: screenW - 60, height: 400), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)], context: nil)
        
        self.frame = CGRect(x:(view.bounds.size.width/2 - (size.width + 30)/2) , y: view.bounds.size.height/2 - 50/2, width: size.width + 30, height: 50)
        
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.8)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.alpha = 0
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        label.text = textMsg
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        self.addSubview(label)
        view.addSubview(self)
        
        weak var weakSelf = self
        UIView.animate(withDuration: 0.3, animations: {
            weakSelf?.alpha = 1
        }) { (finish: Bool) in
            weakSelf?.perform(#selector(weakSelf?.closeCust), with: nil, afterDelay: (weakSelf?.durationF)!)
        }
    }
    
    @objc func closeCust(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (finish:Bool) in
            self.removeFromSuperview()
        }
    }
}

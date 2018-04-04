//
//  ViewController.swift
//  HUD
//
//  Created by Tb on 2018/4/4.
//  Copyright © 2018年 Tb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var indexFlage : Bool = true
    // 懒加载
    lazy var hud : CustView =  {
    () -> CustView in
     let hud = CustView()
     hud.initWithIndicatorWithView(view: self.view, textMsg: "正在加载中...")
        return hud
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.yellow;
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        hud.initWithView(view: self.view, textMsg: "斤斤计较军军", duration: 0.6)
//        if self.indexFlage {
//            hud.startTheView()
//        } else {
//            hud.stopAndRemoveFromSuperView()
//        }
//
//        self.indexFlage = !self.indexFlage
        
        
        
        
        
        
        
        
    }


}


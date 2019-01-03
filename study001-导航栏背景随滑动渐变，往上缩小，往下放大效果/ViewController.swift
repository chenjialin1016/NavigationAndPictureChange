//
//  ViewController.swift
//  study001-导航栏背景随滑动渐变，往上缩小，往下放大效果
//
//  Created by  on 2019/1/2.
//  Copyright © 2019年 . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickBtn(_ sender: Any) {
        let SecondVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
//        let navi = UINavigationController.init(rootViewController: SecondVC)
        self.present(SecondVC, animated: true, completion: nil)
    }
    
}


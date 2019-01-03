//
//  CustomNaviBar.swift
//  study001-导航栏背景随滑动渐变，往上缩小，往下放大效果
//
//  Created by  on 2019/1/2.
//  Copyright © 2019年 . All rights reserved.
//

let Screen_Width = UIScreen.main.bounds.size.width
let Screen_Height = UIScreen.main.bounds.size.height
let StateBar_Height = UIApplication.shared.statusBarFrame.height

let CustomHeight : CGFloat = 30

import UIKit

class CustomNaviBar: UIView {
    
//    var title : String!
//    var leftImage : String!
//    var rightImage : String!
//    var titleColor : UIColor!
    
    var leftBtn : UIButton!
    var rightBtn : UIButton!
    var titleLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame

        self.backgroundColor = UIColor.clear
        
        self.leftBtn = UIButton.init(type: .custom)
        self.leftBtn.frame = CGRect.init(x: 16, y: StateBar_Height+10, width: CustomHeight, height: CustomHeight)
        self.leftBtn.setImage(UIImage.init(named: "button-返回"), for: .normal)
        self.addSubview(self.leftBtn)
        
        self.rightBtn = UIButton.init(type: .custom)
        self.rightBtn.frame = CGRect.init(x: Screen_Width-15-CustomHeight, y: StateBar_Height+10, width: CustomHeight, height: CustomHeight)
        self.addSubview(self.rightBtn)
        
        self.titleLabel = UILabel.init(frame: CGRect.init(x: Screen_Width/2-50, y: StateBar_Height+10, width: 100, height: CustomHeight))
        self.titleLabel.text = "测试标题"
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel.textColor = UIColor.white
        self.addSubview(self.titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

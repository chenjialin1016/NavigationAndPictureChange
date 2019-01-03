//
//  SecondViewController.swift
//  study001-导航栏背景随滑动渐变，往上缩小，往下放大效果
//
//  Created by 陈嘉琳 on 2019/1/2.
//  Copyright © 2019年 陈嘉琳. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bgView : UIImageView!
    var headerView : UIView!
    
    var originalFrame : CGRect!
    
    var customNavi : CustomNaviBar!
    
    let ratio = 0.751

    @IBOutlet weak var tableVIew: UITableView!
    
    //第一种：系统导航栏，利用push跳转，但是有个问题是状态栏的颜色未渐变
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage.init()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //图片
        self.bgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: Screen_Width*0.751))
        self.bgView.image = UIImage.init(named: "11")
        self.view.addSubview(self.bgView)
        self.view.sendSubviewToBack(self.bgView)
        
        self.originalFrame = self.bgView.frame
        
        //第二种：自定义导航栏 CustomNaviBar
        //导航栏
        self.customNavi = CustomNaviBar.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: StateBar_Height+44))
        self.customNavi.backgroundColor = UIColor.clear
        self.view.addSubview(self.customNavi)
        
        //头部
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: 160))
        headerView.backgroundColor = UIColor.clear
        self.tableVIew.tableHeaderView = headerView
        
    }
    
    
    //往上滑动，offset是增加的，往下是减小的
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        
        //第一种：系统导航栏，利用push跳转，但是有个问题是状态栏的颜色未渐变
//        if offset<160 {
//            //滑倒底部之前
//            let coloralph = offset/160
//            self.navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(coloralph)
//            self.navigationController?.title = "测试标题"
//        }else{
//            //滑动超过导航栏底部
//            self.navigationController?.navigationBar.backgroundColor = UIColor.white
//        }
//
//
//        //处理图片放大效果、往上移动效果
//        if offset > 0 {
//            //往上
//
//            bgView.frame = {
//                var bgFrame = originalFrame
//                bgFrame?.origin.y = originalFrame.origin.y-offset
//                return bgFrame!
//            }()
//        }else{
//            //往下放大
//            var bgFrame = originalFrame
//            bgFrame?.size.height = originalFrame.size.height-offset//offset是负的
//            bgFrame!.size.width = (bgFrame?.size.height)!/CGFloat(ratio)
//            bgFrame!.origin.x = (originalFrame.size.width-(bgFrame?.size.width)!)/2
//            self.bgView.frame = bgFrame!
//        }
//
        
        //第二种：自定义导航栏
        //导航栏颜色渐变
        if offset < 160 {
            //滑动到导航栏底部之前
            let cocloralph = offset/160
            self.customNavi.backgroundColor = UIColor.white.withAlphaComponent(cocloralph)
            self.customNavi.titleLabel.textColor = UIColor.white
            self.customNavi.leftBtn.setImage(UIImage.init(named: "button-返回"), for: .normal)
        }else{
            //滑动超过导航栏底部
            self.customNavi.backgroundColor = UIColor.white
            self.customNavi.titleLabel.textColor = UIColor.red
            self.customNavi.leftBtn.setImage(UIImage.init(named: "button-返回B"), for: .normal)
        }
        
        //图片往上移动效果、往下放大效果
        if offset > 0 {
            //移动,offset值是正的
            self.bgView.frame = {
                var bgFrame = originalFrame
                bgFrame?.origin.y = originalFrame.origin.y-offset
                return bgFrame!
            }()
        }else{
            //放大,往下offset是负的，负负得正
            self.bgView.frame = {
                var bgFrame = originalFrame
                bgFrame!.size.height = originalFrame.size.height-offset
                bgFrame!.size.width = ((bgFrame?.size.height)!)/CGFloat(ratio)
                bgFrame!.origin.x = (originalFrame.size.width-((bgFrame?.size.width)!))/2
                return bgFrame!
            }()
        }
        
        print("bgView \(self.bgView.frame)")
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

extension SecondViewController : UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
extension SecondViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

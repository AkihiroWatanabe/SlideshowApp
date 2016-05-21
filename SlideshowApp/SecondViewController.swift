//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by AkihiroWatanabe on 2016/05/17.
//  Copyright © 2016年 Akihiro Watanabe. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 太さ5で赤色の枠線を追加
        secondImageView.layer.borderWidth = 1
        secondImageView.layer.borderColor = UIColor.blackColor().CGColor
        
        // ついでに角を丸める処理
        secondImageView.layer.cornerRadius = 10
        secondImageView.clipsToBounds = true

        secondImageView.image = UIImage(named: secondImage!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var secondImage:String?
    @IBOutlet weak var secondImageView: UIImageView!
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

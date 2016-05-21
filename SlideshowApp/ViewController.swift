//
//  ViewController.swift
//  SlideshowApp
//
//  Created by AkihiroWatanabe on 2016/05/17.
//  Copyright © 2016年 Akihiro Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = UIImage(named: photos[photoNumber])
        // 太さ5で赤色の枠線を追加
        firstImageView.layer.borderWidth = 1
        firstImageView.layer.borderColor = UIColor.blackColor().CGColor
        
        // ついでに角を丸める処理
        firstImageView.layer.cornerRadius = 10
        firstImageView.clipsToBounds = true

        //ツールバーにボタン表示
        underToolBar.items = [leftButton, flexibleSpace, playButton, flexibleSpace, rightButton]
        
        
        // Do any additional setup after loading the view, typically from a nib.
            }


    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //必要なボタンの作成
    let playButton = UIBarButtonItem(barButtonSystemItem: .Play, target: nil,action: "play")
    let pauseButton = UIBarButtonItem(barButtonSystemItem: .Pause, target: nil,action: "play")
    let leftButton = UIBarButtonItem(barButtonSystemItem: .Rewind, target: nil, action: "rewind")
    let rightButton = UIBarButtonItem(barButtonSystemItem: .FastForward, target: nil, action: "fastForward")
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
    
    
    @IBOutlet weak var underToolBar: UIToolbar!
    @IBOutlet weak var firstImageView: UIImageView!

    
    
    //↓↓メソッドの作成
    
    
    // 表示する画像を設定する.
    let photos:[String] = ["hand.png","cat.png","コック.png"]
    //let image1 = UIImage(named: "hand.png")
    //let image2 = UIImage(named: "cat.png")
    //let image3 = UIImage(named: "コック.png")
    
    var counter = 0 //進む、戻るを押すたびに増減する値
    var photoNumber:Int = 0 //辞書のインデックスを指定する番号
    
    func rewind() {
        counter--
        photoNumber = abs(counter) % photos.count
        firstImageView.image = UIImage(named: photos[photoNumber])
    }
    
    func fastForward() {
        counter++
        photoNumber = abs(counter) % photos.count
        firstImageView.image = UIImage(named: photos[photoNumber])
    }

    
    var slideShow:NSTimer?
    func play() {
        
        if let slideShowTimer = self.slideShow {
            
            if slideShowTimer.valid == true{
                
                //停止ボタンの処理
                slideShowTimer.invalidate()
                underToolBar.items = [leftButton, flexibleSpace, playButton, flexibleSpace, rightButton]
                leftButton.enabled = true
                rightButton.enabled = true
                print(slideShow)
                
            } else{
                
                //再生ボタンの処理
                //↓をslideShowTimerにしたら、押しても再生はされるがslideShowTimer.valid == trueにならずボタンが切り替わらない
                slideShow = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("fastForward"), userInfo: nil, repeats: true)
                
                underToolBar.items = [leftButton, flexibleSpace, pauseButton, flexibleSpace, rightButton]
                
                leftButton.enabled = false
                rightButton.enabled = false
                
                print(slideShow)
                
                
            }
            
            
        } else {
            
            //初めてボタンを押したとき（self.slideShow=nilのとき）の処理
            slideShow = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("changePhoto"), userInfo: nil, repeats: true)
            
            underToolBar.items = [leftButton, flexibleSpace, pauseButton, flexibleSpace, rightButton]
            leftButton.enabled = false
            rightButton.enabled = false
            
        }
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        let secondViewController:SecondViewController = segue.destinationViewController as! SecondViewController
       
        secondViewController.secondImage = photos[photoNumber]
        
        
        
    }

    
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
}


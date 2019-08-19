//
//  ViewController.swift
//  BGMSample
//
//  Created by 渡邉舜也 on 19/08/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    //ボタンをアウトレット接続
    @IBOutlet weak var button: UIButton!
    
    //カセットデッキ的なやつ
    var  player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //再生する音楽ファイルのパスを作成
        let  audioPath = Bundle.main.path(forResource:"bgm1" , ofType: "mp3")!
        
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        //音楽ファイルを元にプレイヤー作成
        do{
            player = try AVAudioPlayer(contentsOf: audioUrl)
            
            //無限ループ(-1にすると無限ループになる)
            player.numberOfLoops = -1
        }catch let error {
            print(error.localizedDescription)
        }
        //再生
        player.delegate = self  //おまじない
        player.prepareToPlay() //再生の準備
        player.play()  //再生
    }

    @IBAction func didClickButton(_ sender: Any) {
        //ボタンの現在のタイトルが"一時停止"だったら
        if button.currentTitle == "一時停止"{
            player.pause()
            button.setTitle("再生", for: .normal)
        //ボタンの現在のタイトルが"一時停止"以外だったら
        } else{
            player.play()
            button.setTitle("一時停止", for: .normal)
            
        }
    }
    
}


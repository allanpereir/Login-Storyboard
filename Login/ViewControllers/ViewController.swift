//
//  ViewController.swift
//  Login
//
//  Created by Alan Silva on 21/05/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer: AVPlayer?
    
    var videoPlayerLayer: AVPlayerLayer?

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    func setUpElements(){
        
        Utilities.styleButton(signUpButton)
        Utilities.styleHollowButton(loginButtom)

    }
    func setUpVideo (){
        
        //Pegar o caminho do video
        let bundlePath = Bundle.main.path(forResource: "loginVideo", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        //Criar a URL
        let url = URL(fileURLWithPath: bundlePath!)
        
        //Criar o video Player do item
        let item = AVPlayerItem(url: url)
        
        //Criar o player
        videoPlayer = AVPlayer(playerItem: item)
        
        //Criar o Layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        //Ajustar o tamanho do frame
       // videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        //Play de video
        videoPlayer?.playImmediately(atRate: 0.4)
        
        
    }

}


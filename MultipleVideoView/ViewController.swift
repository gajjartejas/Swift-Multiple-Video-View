//
//  ViewController.swift
//
//  Created by Four on 25/06/19.
//  Copyright © 2019 Four. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var mPlaybackView: AVPlayerPlaybackView!
    @IBOutlet weak var mPlaybackView2: AVPlayerPlaybackView!
    @IBOutlet weak var mPlaybackView3: AVPlayerPlaybackView!
    
    var mPlayer: AVPlayer?
    var mPlayer2: AVPlayer?
    var mPlayer3: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
        
        let url2 = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!

        let url3 = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4")!
        
        
        self.mPlayer = AVPlayer(url: url)
        self.mPlayer2 = AVPlayer(url: url2)
        self.mPlayer3 = AVPlayer(url: url3)

        
        mPlayer?.addObserver(self, forKeyPath: "status", options: [.old, .new], context: nil)
        if #available(iOS 10.0, *) {
            mPlayer?.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        } else {
            mPlayer?.addObserver(self, forKeyPath: "rate", options: [.old, .new], context: nil)
        }
        
        mPlayer2?.addObserver(self, forKeyPath: "status", options: [.old, .new], context: nil)
        if #available(iOS 10.0, *) {
            mPlayer2?.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        } else {
            mPlayer2?.addObserver(self, forKeyPath: "rate", options: [.old, .new], context: nil)
        }
        
        mPlayer3?.addObserver(self, forKeyPath: "status", options: [.old, .new], context: nil)
        if #available(iOS 10.0, *) {
            mPlayer3?.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        } else {
            mPlayer3?.addObserver(self, forKeyPath: "rate", options: [.old, .new], context: nil)
        }

    }

    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if object as? AVPlayer == mPlayer {
            if keyPath == "status" {
                
                if mPlayer?.status == .readyToPlay {
                    self.mPlaybackView.setPlayer(player: mPlayer!)
                    mPlayer?.play()
                }
            } else if keyPath == "timeControlStatus" {
                if #available(iOS 10.0, *) {
                    if mPlayer?.timeControlStatus == .playing {
                    } else {
                        
                    }
                }
            } else if keyPath == "rate" {
//                if mPlayer?.rate > 0 {
//                } else {
//                    
//                }
            }
        } else if object as? AVPlayer == mPlayer2 {
            if keyPath == "status" {
                
                if mPlayer2?.status == .readyToPlay {
                    self.mPlaybackView2.setPlayer(player: mPlayer2!)
                    mPlayer2?.play()
                }
            } else if keyPath == "timeControlStatus" {
                if #available(iOS 10.0, *) {
                    if mPlayer2?.timeControlStatus == .playing {
                    } else {
                        
                    }
                }
            } else if keyPath == "rate" {
                //                if mPlayer?.rate > 0 {
                //                } else {
                //
                //                }
            }
        } else if object as? AVPlayer == mPlayer3 {
            if keyPath == "status" {
                
                if mPlayer3?.status == .readyToPlay {
                    self.mPlaybackView3.setPlayer(player: mPlayer3!)
                    mPlayer3?.play()
                }
            } else if keyPath == "timeControlStatus" {
                if #available(iOS 10.0, *) {
                    if mPlayer3?.timeControlStatus == .playing {
                    } else {
                    }
                }
            } else if keyPath == "rate" {
                //                if mPlayer?.rate > 0 {
                //                } else {
                //
                //                }
            }
        }
    }
    

}


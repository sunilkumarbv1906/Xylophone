//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyButton(_ sender: UIButton) {
        guard let text = sender.currentTitle else{
            return
        }
        audioPlayer(soundText: text)
        self.changeAlpha()
        sender.alpha = 0.5
//        guard let button = sender as? UIButton else{return}
//        sender.alpha = 0.5
    }
    
    
    func changeAlpha(){
        btn1.alpha = 1.0
        btn2.alpha = 1.0
        btn3.alpha = 1.0
        btn4.alpha = 1.0
        btn5.alpha = 1.0
        btn6.alpha = 1.0
        btn7.alpha = 1.0
    }
    
    func audioPlayer(soundText : String) {
        guard let url = Bundle.main.path(forResource: soundText, ofType: "wav") else {return}
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url), fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            
            player.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}



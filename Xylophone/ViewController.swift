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

    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let value = (sender.titleLabel?.text)!
        sender.alpha = 0.5
        playSound(value)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(_ string : String) {
        guard let url = Bundle.main.url(forResource: string, withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
}


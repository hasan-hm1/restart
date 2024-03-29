//
//  AudioPlayer.swift
//  Restart
//
//  Created by Hasan on 3/29/24.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:  path))
            audioPlayer?.play()
        } catch{
           print("could not play the requested sound")
        }
    }
    
}

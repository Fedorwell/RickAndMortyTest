//
//  SoundController.swift
//  RickAndMortyTest
//
//  Created by Kirill Sinenchenko on 18.12.2023.
//

import AVFoundation

class SoundController {
    
    var audioPlayer: AVAudioPlayer?
    
    init(fileName: String, fileType: String) {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: "Resource") {
            let fileURL = URL(fileURLWithPath: filePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.volume = 0.8
            } catch {
                print("Ошибка: не удалось создать AVAudioPlayer - \(error)")
            }
        } else {
            print("Ошибка: файл аудио не найден")
        }
    }
    
    func play() {
        if audioPlayer?.currentTime == 0 {
            audioPlayer?.play()
        }
    }
    
    func stop() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
    
    func pause() {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
        }
    }
    
}

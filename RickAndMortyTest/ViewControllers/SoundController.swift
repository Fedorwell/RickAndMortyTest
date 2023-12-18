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
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileType) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.volume = 0.05
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

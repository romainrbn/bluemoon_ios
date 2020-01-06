//
//  VideoView.swift
//  BMPAGETEST
//
//  Created by Romain Rabouan on 10/11/2019.
//  Copyright © 2019 Romain Rabouan. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit
import UIKit

// Make an AVPlayer in SwiftUI

struct Player: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Player>) -> PlayerUIView {
        return PlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: PlayerUIView, context: UIViewRepresentableContext<Player>) {
        
    }
}

class PlayerUIView: UIView {
    
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        // Le chemin jusqu'à mon fichier qui contient la vidéo
        guard let path = Bundle.main.path(forResource: "BM2K20", ofType: "mp4") else {
            debugPrint("video not found")
            return
        }
      
        // Je convertis ce chemin en URL
        let url = URL(fileURLWithPath: path)
        
        // Je créé un lecteur de vidéo avec cette URL
        let player = AVPlayer(url: url)
        
        
        // Je joue la vidéo
        player.play()
        
        // J'enlève le son
        player.isMuted = true
      
        // J'ajoute mon lecteur à ma fenêtre
        playerLayer.player = player
        
        // Aspect de la vidéo
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Jouer en boucle la vidéo
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
            player.seek(to: CMTime.zero)
            player.play()
        }
        
        
        // Je fais en sorte que la vidéo n'enlève pas le son actuel (comme par exemple la musique...)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch let error as NSError {
            print(error)
        }

        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print(error)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init not implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer.frame = bounds
    }
}


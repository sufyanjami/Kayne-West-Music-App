//
//  AlbumButton.swift
//  KanyeWestMusicPlayer
//
//  Created by Sufyan Jami on 2020-01-04.
//  Copyright © 2020 Sufyan Jami. All rights reserved.
//

import UIKit
import MediaPlayer

//Main Class
class AlbumButton: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //Album Button
    @IBAction func albumButtonPressed(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization{ (status) in
            if status == .authorized {
                self.playAlbum(genre: sender.currentTitle!)
            }
        }
    }
    
    //Stop Button
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        musicPlayer.stop()
    }
    

    //Next Button
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    //Genre Function
    func playAlbum(genre: String){
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyAlbumTitle)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
    
}

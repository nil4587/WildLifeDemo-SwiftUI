//
//  VideoPlayerHelper.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 04/08/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(with fileName: String, fileFormat: String) -> AVPlayer? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        return nil
    }
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    return videoPlayer
}

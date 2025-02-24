//
//  PlistVideoLoader.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import Foundation

class PlistVideoLoader: VideoDataLoader {
    func loadVideos() -> [Video] {
        var videoFilename = "Videos"
        guard let path = Bundle.main.path(forResource: videoFilename, ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: String] else {
            return []
        }

        return dict.values.map { Video(publicId: $0) }
    }
}

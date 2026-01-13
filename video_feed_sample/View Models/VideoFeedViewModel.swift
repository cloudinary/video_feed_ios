//
//  VideoFeedViewModel.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import Foundation

class VideoFeedViewModel {
    private let dataLoader: VideoDataLoader
    private(set) var videos: [Video] = []
    
    // Callback for when videos are loaded
    var onVideosLoaded: (() -> Void)?

    init(dataLoader: VideoDataLoader = PlistVideoLoader()) {
        self.dataLoader = dataLoader
    }

    func fetchVideos() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            let loadedVideos = self.dataLoader.loadVideos()
            
            DispatchQueue.main.async {
                self.videos = loadedVideos
                self.onVideosLoaded?()
            }
        }
    }
    
    func video(at index: Int) -> Video? {
        guard !videos.isEmpty else { return nil }
        return videos[index % videos.count]
    }
}

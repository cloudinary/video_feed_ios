//
//  VideoFeedViewModel.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

class VideoFeedViewModel {
    private let dataLoader: VideoDataLoader
    private(set) var videos: [Video] = []

    init(dataLoader: VideoDataLoader = PlistVideoLoader()) {
        self.dataLoader = dataLoader
        fetchVideos()
    }

    func fetchVideos() {
        videos = dataLoader.loadVideos()
    }
}

//
//  VideoPlayerService.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import Foundation
import AVFoundation
import Cloudinary

class VideoPlayerService {
    static let shared = VideoPlayerService()
    
    // Cache map: publicId -> CLDVideoPlayer
    private var playerCache: [String: CLDVideoPlayer] = [:]
    // Keep track of keys to enforce limit
    private var cacheKeys: [String] = []
    private let maxCacheSize = 5 // Keep current + 2 prev + 2 next
    
    private init() {}
    
    func getPlayer(for video: Video) -> CLDVideoPlayer {
        if let player = playerCache[video.publicId] {
            // Move to end (most recently used)
            if let index = cacheKeys.firstIndex(of: video.publicId) {
                cacheKeys.remove(at: index)
                cacheKeys.append(video.publicId)
            }
            return player
        }
        
        return createPlayer(for: video)
    }
    
    func preloadVideo(_ video: Video) {
        if playerCache[video.publicId] == nil {
            _ = createPlayer(for: video)
        }
    }
    
    private func createPlayer(for video: Video) -> CLDVideoPlayer {
        guard let url = URL(string: video.generateURLString()) else {
            return CLDVideoPlayer(url: URL(string: "http://example.com")!) // Fallback
        }
        
        let player = CLDVideoPlayer(url: url)
        
        // Add to cache
        playerCache[video.publicId] = player
        cacheKeys.append(video.publicId)
        
        // Enforce cache limit
        if cacheKeys.count > maxCacheSize {
            let keyToRemove = cacheKeys.removeFirst()
            playerCache.removeValue(forKey: keyToRemove)
        }
        
        return player
    }
    
    func pauseAllPlayers() {
        for player in playerCache.values {
            player.pause()
        }
    }
}

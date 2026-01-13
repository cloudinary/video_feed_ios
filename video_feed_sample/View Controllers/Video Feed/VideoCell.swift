//
//  VideoCell.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import UIKit
import Cloudinary
import AVFoundation
import AVKit

class VideoCell: UICollectionViewCell {

    static let identifier = "VideoCell"

    private var player: CLDVideoPlayer?
    private var playerViewController: AVPlayerViewController?
    private var observer: NSObjectProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .black // Full screen background
    }

    func configure(with video: Video) {
        // cleanup old observer
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
            self.observer = nil
        }

        // Get player from service
        let player = VideoPlayerService.shared.getPlayer(for: video)
        player.isMuted = true
        self.player = player

        // Lazy load player view controller
        if playerViewController == nil {
            let pvc = AVPlayerViewController()
            pvc.videoGravity = .resizeAspectFill
            pvc.showsPlaybackControls = false
            pvc.view.backgroundColor = .black
            
            contentView.addSubview(pvc.view)
            pvc.view.frame = bounds
            pvc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.playerViewController = pvc
            addVideoOverlay(pvc)
        }
        
        playerViewController?.player = player
        
        // Add Observer for Looping using block-based observer for easier lifecycle management
        self.observer = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { [weak self] _ in
            self?.player?.seek(to: .zero)
            self?.player?.play()
        }
    }

    private func addVideoOverlay(_ playerController: AVPlayerViewController) {
        // Load the view controller from the "VideoSocialOverlay" storyboard
        let overlayViewController = UIStoryboard(name: "VideoSocialOverlays", bundle: nil).instantiateViewController(withIdentifier: "VideoSocialOverlaysController")

        // Add the overlay view controller as a child of AVPlayerViewController
        playerController.addChild(overlayViewController)
        overlayViewController.didMove(toParent: playerController)

        // Add the overlay view controller's view as a subview to playerController's contentOverlayView
        // Use contentOverlayView if available, else view
        let targetView = playerController.contentOverlayView ?? playerController.view
        targetView?.addSubview(overlayViewController.view)
        overlayViewController.view.frame = targetView?.bounds ?? .zero
        overlayViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        pause()
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
            self.observer = nil
        }
        playerViewController?.player = nil
        player = nil
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

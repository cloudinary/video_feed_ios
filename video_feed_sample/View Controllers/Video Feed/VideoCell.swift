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
        // Remove existing player
        playerViewController?.view.removeFromSuperview()
        player?.pause()
        player = nil

        let player = CLDVideoPlayer(url: URL(string: video.generateURLString())!)
        self.player = player

        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.videoGravity = .resizeAspectFill
        playerViewController.showsPlaybackControls = false  // Hide controls for TikTok-like experience
        playerViewController.view.frame = bounds
        playerViewController.view.backgroundColor = .black
 
        contentView.addSubview(playerViewController.view)
        self.playerViewController = playerViewController

        // Add Observer for Looping
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
        addVideoOverlay(playerViewController)
    }

    private func addVideoOverlay(_ playerController: AVPlayerViewController) {
        // Load the view controller from the "VideoSocialOverlay" storyboard
        let overlayViewController = UIStoryboard(name: "VideoSocialOverlays", bundle: nil).instantiateViewController(withIdentifier: "VideoSocialOverlaysController")

        // Add the overlay view controller as a child of AVPlayerViewController
        playerController.addChild(overlayViewController)
        overlayViewController.didMove(toParent: playerController)

        // Add the overlay view controller's view as a subview to playerController's contentOverlayView
        playerController.contentOverlayView?.addSubview(overlayViewController.view)
        overlayViewController.view.frame = playerController.contentOverlayView?.bounds ?? .zero
        overlayViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }


    @objc private func playerDidFinishPlaying(_ notification: Notification) {
        player?.seek(to: .zero)
        player?.play()
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
    }
}

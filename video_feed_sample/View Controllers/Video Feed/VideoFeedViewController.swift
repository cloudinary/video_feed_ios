//
//  VideoFeedViewController.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import UIKit
import Cloudinary

class VideoFeedViewController: UIViewController, VideoSelectionDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    private var videos: [Video] = []
    private var collectionHandler: VideoFeedCollectionHandler?
    @IBOutlet weak var vwToolbar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadVideos()
    }

    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)

        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.identifier)

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }

    private func loadVideos() {
        let dataLoader = PlistVideoLoader()
        videos = dataLoader.loadVideos()

        collectionHandler = VideoFeedCollectionHandler(videos: videos, delegate: self)
        collectionView.dataSource = collectionHandler
        collectionView.delegate = collectionHandler 
        collectionView.reloadData()
    }

    // MARK: - VideoSelectionDelegate
    func didSelectVideo(_ video: Video) {
        // No action needed for now, as videos auto-play
    }
}

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
    @IBOutlet weak var vwToolbar: UIView!

    private var viewModel = VideoFeedViewModel()
    private var collectionHandler: VideoFeedCollectionHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchVideos()
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
    
    private func bindViewModel() {
        viewModel.onVideosLoaded = { [weak self] in
            self?.setupCollectionView()
        }
    }

    private func setupCollectionView() {
        collectionHandler = VideoFeedCollectionHandler(videos: viewModel.videos, delegate: self)
        collectionView.dataSource = collectionHandler
        collectionView.delegate = collectionHandler
        collectionView.prefetchDataSource = collectionHandler
        collectionView.reloadData()

        // Auto-play the first video once the UI is ready
        DispatchQueue.main.async {
            self.playFirstVideo()
        }
    }

    private func playFirstVideo() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        // Ensure layout is up to date
        collectionView.layoutIfNeeded()
        
        if let cell = collectionView.cellForItem(at: firstIndexPath) as? VideoCell {
            cell.play()
        }
    }

    // MARK: - VideoSelectionDelegate
    func didSelectVideo(_ video: Video) {
        // No action needed for now, as videos auto-play
    }
}

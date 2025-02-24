//
//  VideoFeedCollectionHandler.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import UIKit

class VideoFeedCollectionHandler: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var videos: [Video] = []
    weak var delegate: VideoSelectionDelegate?

    init(videos: [Video], delegate: VideoSelectionDelegate) {
        self.videos = videos
        self.delegate = delegate
    }

    // MARK: - UICollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count * 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCell.identifier, for: indexPath) as! VideoCell
        cell.configure(with: videos[indexPath.row % videos.count])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let toolbarHeight = (collectionView.superview?.superview as? VideoFeedViewController)?.vwToolbar.frame.height ?? 0
        let safeAreaBottom = collectionView.safeAreaInsets.bottom
        let availableHeight = collectionView.bounds.height - toolbarHeight - safeAreaBottom

        return CGSize(width: collectionView.bounds.width, height: availableHeight)
    }


    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }

        let pageHeight = collectionView.bounds.height
        let nearestIndex = round(collectionView.contentOffset.y / pageHeight)

        let targetOffset = CGPoint(x: 0, y: nearestIndex * pageHeight)

        // 🔥 Force the collection view to snap exactly to one full-screen cell
        collectionView.setContentOffset(targetOffset, animated: true)

        // Pause all videos
        collectionView.visibleCells.forEach { cell in
            (cell as? VideoCell)?.pause()
        }

        // Play only the fully visible cell
        let visibleIndex = Int(nearestIndex)
        if let cell = collectionView.cellForItem(at: IndexPath(item: visibleIndex, section: 0)) as? VideoCell {
            cell.play()
        }
    }
}


// Protocol for handling video selection
protocol VideoSelectionDelegate: AnyObject {
    func didSelectVideo(_ video: Video)
}

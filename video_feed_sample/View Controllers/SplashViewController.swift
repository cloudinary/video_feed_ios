//
//  SplashViewController.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigateToMain()
    }

    private func navigateToMain() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let storyboard = UIStoryboard(name: "VideoFeed", bundle: nil)
            if let mainVC = storyboard.instantiateViewController(withIdentifier: "VideoFeedViewController") as? VideoFeedViewController {
                mainVC.modalTransitionStyle = .crossDissolve
                mainVC.modalPresentationStyle = .fullScreen
                self.present(mainVC, animated: true)
            }
        }
    }
}

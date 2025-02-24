//
//  CloudinaryHelper.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 24/02/2025.
//

import Cloudinary
class CloudinaryHelper {
    static let shared = CloudinaryHelper()

    private let cloudinary = CLDCloudinary(configuration: CLDConfiguration(cloudName: "mobiledemoapp", secure: true, analytics: false))

    func getCloudinary() -> CLDCloudinary {
        return cloudinary
    }

}

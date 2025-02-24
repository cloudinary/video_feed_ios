//
//  Video.swift
//  video_feed_sample
//
//  Created by Adi Mizrahi on 06/02/2025.
//

import Cloudinary

struct Video: Codable {
    let publicId: String


    func generateURLString() -> String {
        let urlString = CloudinaryHelper.shared.getCloudinary().createUrl().setTransformation(CLDTransformation().setStreamingProfile("auto")).setResourceType("video").setFormat("m3u8").generate(publicId)
        return urlString!
    }
}

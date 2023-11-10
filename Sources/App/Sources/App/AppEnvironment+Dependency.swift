// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Foundation
import Coordinator

public class AppEnvironment {
    public init() {}
}

public extension AppEnvironment {
    static var live: AppEnvironment {
        return AppEnvironment()
    }
}

public extension AppEnvironment {
//    var galleryDependency: GalleryDependency { GalleryDependency(photoLibrary: photoLibrary) }
//    var cameraDependency: CameraDependency { CameraDependency(camera: camera, photoLibrary: photoLibrary) }
//
//    func photoDependency(photo: UIImage?, assetId: String, fileName: String) -> PhotoDependency {
//        PhotoDependency(
//            photo: photo,
//            assetId: assetId,
//            fileName: fileName,
//            photoLibrary: photoLibrary
//        )
//    }
}

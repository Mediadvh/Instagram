//
//  ImageUploader.swift
//  Instagram
//
//  Created by Media Davarkhah on 6/24/1400 AP.
//

import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completionHandler: @escaping(String) -> Void) {
        
        // compress image
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let uuid = NSUUID()
        let fileName = uuid.uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                completionHandler(imageUrl)
            }
        }
        
    }
}

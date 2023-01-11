//
//  StorageManager.swift
//  InstagramCloneCoding
//
//  Created by Gray on 2023/01/07.
//

import FirebaseStorage

public class StorageManager {

    static let shared = StorageManager()

    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    // MARK: - Public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
        
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, Error>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(IGStorageManagerError.failedToDownload)) // .failedToDownload는 안됨
                return
            }
            
            completion(.success(url))
        })
    }

}

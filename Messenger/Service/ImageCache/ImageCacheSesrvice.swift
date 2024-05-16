//
//  ImageCacheSesrvice.swift
//  Messenger
//
//  Created by 영현 on 5/16/24.
//

import UIKit
import Combine

protocol ImageCacheSesrviceType {
    func image(for key: String) -> AnyPublisher<UIImage?, Never>
}

class ImageCacheSesrvice: ImageCacheSesrviceType {
    
    let memorySotrage: MemoryStorageType
    let diskStorage: DiskStorageType
    
    init(memorySotrage: MemoryStorageType, diskStorage: DiskStorageType) {
        self.memorySotrage = memorySotrage
        self.diskStorage = diskStorage
    }
    
    func image(for key: String) -> AnyPublisher<UIImage?, Never> {
        /*
         1. memory storage
         2. disk storage
         3. url session
         */
        
        imageWithMemoryCache(for: key)
            .flatMap { image -> AnyPublisher<UIImage?, Never> in
                if let image {
                    return Just(image).eraseToAnyPublisher()
                } else {
                    return self.imageWithDiskCache(for: key)
                }
            }
            .eraseToAnyPublisher()
        
    }
    
    func imageWithMemoryCache(for key: String) -> AnyPublisher<UIImage?, Never> {
        Future { [weak self] promise in
            let image = self?.memorySotrage.value(for: key)
            promise(.success(image))
        }.eraseToAnyPublisher()
    }
    
    func imageWithDiskCache(for key: String) -> AnyPublisher<UIImage?, Never> {
        Future<UIImage?, Never> { [weak self] promise in
            do {
                let image = try self?.diskStorage.value(for: key)
                promise(.success(image))
            } catch {
                promise(.success(nil))
            }
        }
        .flatMap { image -> AnyPublisher<UIImage?, Never>  in
            if let image {
                return Just(image)
                    .handleEvents(receiveOutput: { [weak self] image in
                        guard let image else { return }
                        self?.store(for: key, image: image, toDisk: false)
                    })
                    .eraseToAnyPublisher()
            } else {
                return self.remoteImage(for: key)
            }
        }
        .eraseToAnyPublisher()
    }
    
    func remoteImage(for urlString: String) -> AnyPublisher<UIImage?, Never>  {
        URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map { data, _ in
                UIImage(data: data)
            }
            .replaceError(with: nil)
            .handleEvents(receiveOutput: { [weak self] image in
                guard let image else { return }
                self?.store(for: urlString, image: image, toDisk: true)
            })
            .eraseToAnyPublisher()
    }
    
    func store(for key: String, image: UIImage, toDisk: Bool) { // 캐시에 저장
        memorySotrage.store(for: key, image: image)
        
        if toDisk {
            try? diskStorage.store(for: key, image: image)
        }
    }
}

class StubImageCacheSesrvice: ImageCacheSesrviceType {
    
    func image(for key: String) -> AnyPublisher<UIImage?, Never> {
        Empty().eraseToAnyPublisher()
    }
}

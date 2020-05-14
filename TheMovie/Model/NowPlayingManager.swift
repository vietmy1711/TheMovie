//
//  NowPlayingManager.swift
//  TheMovie
//
//  Created by MM on 5/14/20.
//  Copyright © 2020 MM. All rights reserved.
//

import Foundation



protocol NowPlayingManagerDelegate {
    func didUpdateNowPlaying(_ nowPlayingManager: NowPlayingManager,_ nowPlayingModel: NowPlaying)
    func didFailWithError(error: Error)
}

struct NowPlayingManager {
    let nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    private let apiKey = "5d78fc9985dc5af97b923b929bd07fe2"
    
    var delegate: NowPlayingManagerDelegate?
    
    
    func fetchNowPlaying() {
        let urlString = "\(nowPlayingURL)\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                guard error == nil else { return }
                guard let safeData = data else { return }
                guard let getNowPlaying = self.parseJSON(nowPlaying: safeData) else { return }
                self.delegate?.didUpdateNowPlaying(self, getNowPlaying)

            }
            task.resume()
        }
    }
    
    func parseJSON(nowPlaying: Data) -> NowPlaying? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(NowPlaying.self, from: nowPlaying)
            let results = decodedData.results
            
            let nowPlaying = NowPlaying(results: results)
            return nowPlaying
        } catch {
            
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
    
}

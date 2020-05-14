//
//  NowPlaying.swift
//  TheMovie
//
//  Created by MM on 5/14/20.
//  Copyright © 2020 MM. All rights reserved.
//

import Foundation

struct NowPlaying: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let id: Int
    let title: String
    let poster_path: String
    let vote_average: Float
    let release_date: String
    let overview: String
}

//
//  searchResult.swift
//  appStore
//
//  Created by admin on 2019-04-29.
//  Copyright © 2019 Hao-Tse. All rights reserved.
//

import Foundation

struct searchResultApp: Decodable {
    let resultCount: Int
    let results: [ResultApp]
    
}

struct ResultApp: Decodable{
    let trackName: String
    let primaryGenreName: String
}

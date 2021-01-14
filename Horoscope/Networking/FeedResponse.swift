//
//  FeedResponse.swift
//  Horoscope
//
//  Created by Roman on 14.01.2021.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]

}

struct FeedItem: Decodable {

    let count: CountableItem?
   
    
}

struct CountableItem: Decodable {
    let count: Int
}


//
//  MenuItem.swift
//  RestaurantApp
//
//  Created by Rens Gingnagel on 30/11/2017.
//  Copyright © 2017 Rens Gingnagel. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageURL = "image_url"
    }
}

struct MenuItems: Codable {
    let items: [MenuItem]
}






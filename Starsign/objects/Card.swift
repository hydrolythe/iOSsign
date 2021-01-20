//
//  Card.swift
//  Starsign
//
//  Created by Guylian Bollon on 15/10/2020.
//

import Foundation

class Card:Codable{
    var title:String
    init(title:String){
        self.title=title
    }
    private enum CodingKeys: String, CodingKey{
        case title
    }
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey:.title)
    }
}

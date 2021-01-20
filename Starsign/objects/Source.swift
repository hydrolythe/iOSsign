//
//  Source.swift
//  Starsign
//
//  Created by Guylian Bollon on 15/10/2020.
//

import Foundation

class Source:Card{
    var generatedmana=[Mana:Int]()
    init(title:String,generatedmana:[Mana:Int]){
        self.generatedmana=generatedmana
        super.init(title:title)
    }
    init(card:Recard){
        self.generatedmana=card.generatedmana
        super.init(title:card.title)
    }
    private enum CodingKeys: String, CodingKey{
        case generatedmana
    }
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy:CodingKeys.self)
        generatedmana = try container.decode([Mana:Int].self,forKey:.generatedmana)
        let superDecoder = try container.superDecoder()
        try super.init(from:superDecoder)
    }
}

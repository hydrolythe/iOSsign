//
//  Magic.swift
//  Starsign
//
//  Created by Guylian Bollon on 15/10/2020.
//

import Foundation

class Magic:Card{
    var cost=[Mana:Int]()
    var specie:Spellspecies
    var magic=[Spell:Int]()
    init(title:String,cost:[Mana:Int],specie:Spellspecies,magic:[Spell:Int]){
        self.cost=cost
        self.specie=specie
        self.magic=magic
        super.init(title:title)
    }
    init(card:Recard){
        self.cost=card.cost
        self.specie=card.specie
        self.magic=card.magic
        super.init(title:card.title)
    }
    private enum CodingKeys: String, CodingKey{
        case cost
        case specie
        case magic
    }
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy:CodingKeys.self)
        cost = try container.decode([Mana:Int].self,forKey:.cost)
        specie = try container.decode(Spellspecies.self,forKey:.specie)
        magic = try container.decode([Spell:Int].self,forKey:.magic)
        let superDecoder = try container.superDecoder()
        try super.init(from:superDecoder)
    }
}

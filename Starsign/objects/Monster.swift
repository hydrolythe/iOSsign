//
//  Monster.swift
//  Starsign
//
//  Created by Guylian Bollon on 15/10/2020.
//

import Foundation

class Monster:Card{
    var manarequirements=[Mana:Int]()
    var life:Int
    var attack:Int
    var defense:Int
    var magicattack:Int
    var magicdefense:Int
    var mp:Int
    var magic=[Spell:Int]()
    init(title:String,manarequirements:[Mana:Int],life:Int,attack:Int,defense:Int,magicattack:Int,magicdefense:Int,mp:Int,magic:[Spell:Int]){
        self.manarequirements=manarequirements
        self.life=life
        self.attack=attack
        self.defense=defense
        self.magicattack=magicattack
        self.magicdefense=magicdefense
        self.magic=magic
        self.mp=mp
        super.init(title:title)
    }
    init(card:Recard){
        self.manarequirements=card.manarequirements
        self.life=card.life
        self.attack=card.attack
        self.defense=card.defense
        self.magicattack=card.magicattack
        self.magicdefense=card.magicdefense
        self.magic=card.magic
        self.mp=card.mp
        super.init(title:card.title)
    }
    private enum CodingKeys: String, CodingKey{
        case manarequirements
        case life
        case attack
        case defense
        case magicattack
        case magicdefense
        case magic
        case mp
    }
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        manarequirements = try container.decode([Mana:Int].self,forKey:.manarequirements)
        life = try container.decode(Int.self,forKey:.life)
        attack = try container.decode(Int.self, forKey:.attack)
        defense = try container.decode(Int.self, forKey:.defense)
        magicattack = try container.decode(Int.self, forKey:.magicattack)
        magicdefense = try container.decode(Int.self, forKey:.magicdefense)
        mp = try container.decode(Int.self, forKey:.mp)
        magic = try container.decode([Spell:Int].self, forKey:.magic)
        let superDecoder = try container.superDecoder()
        try super.init(from:superDecoder)
    }
}

//
//  Recard.swift
//  Starsign
//
//  Created by Guylian Bollon on 31/10/2020.
//

import Foundation
class Recard:Codable{
    var title:String
    var type:Type
    var manarequirements=[Mana:Int]()
    var life:Int
    var attack:Int
    var defense:Int
    var magicattack:Int
    var magicdefense:Int
    var mp:Int
    var magic=[Spell:Int]()
    var cost=[Mana:Int]()
    var specie:Spellspecies
    var generatedmana=[Mana:Int]()
    
    init(monster:Monster){
        self.title=monster.title
        self.type=Type.Monster
        self.manarequirements=monster.manarequirements
        self.life=monster.life
        self.attack=monster.attack
        self.defense=monster.defense
        self.magicattack=monster.magicattack
        self.magicdefense=monster.magicdefense
        self.mp = monster.mp
        self.magic = monster.magic
        self.specie = Spellspecies.EQUIP
    }
    init(magic:Magic){
        self.title=magic.title
        self.type=Type.Magic
        self.cost=magic.cost
        self.magic=magic.magic
        self.specie=magic.specie
        self.life=0
        self.attack=0
        self.defense=0
        self.magicattack=0
        self.magicdefense=0
        self.mp=0
    }
    init(source:Source){
        self.title=source.title
        self.type=Type.Source
        self.generatedmana=source.generatedmana
        self.life=0
        self.attack=0
        self.defense=0
        self.magicattack=0
        self.magicdefense=0
        self.mp=0
        self.specie=Spellspecies.EQUIP
    }
    private enum CodingKeys: String, CodingKey{
        case title
        case type
        case manarequirements
        case life
        case attack
        case defense
        case magicattack
        case magicdefense
        case magic
        case mp
        case cost
        case specie
        case generatedmana
    }
    required init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self,forKey:.title)
        type = try container.decode(Type.self, forKey:.type)
        manarequirements = try container.decode([Mana:Int].self,forKey:.manarequirements)
        life = try container.decode(Int.self,forKey:.life)
        attack = try container.decode(Int.self, forKey:.attack)
        defense = try container.decode(Int.self, forKey:.defense)
        magicattack = try container.decode(Int.self, forKey:.magicattack)
        magicdefense = try container.decode(Int.self, forKey:.magicdefense)
        mp = try container.decode(Int.self, forKey:.mp)
        magic = try container.decode([Spell:Int].self, forKey:.magic)
        cost = try container.decode([Mana:Int].self,forKey:.cost)
        specie = try container.decode(Spellspecies.self,forKey:.specie)
        generatedmana = try container.decode([Mana:Int].self,forKey:.generatedmana)
    }
}

enum Type{
    case Monster
    case Magic
    case Source
}
extension Type:Codable{
    enum Key:CodingKey{
        case rawValue
    }
    enum CodingError:Error{
        case unknownValue
    }
    init(from decoder:Decoder) throws{
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue{
        case 0:
            self = .Monster
        case 1:
            self = .Magic
        case 2:
            self = .Source
        default:
            throw CodingError.unknownValue
        }
    }
    func encode(to encoder:Encoder) throws{
        var container = encoder.container(keyedBy: Key.self)
        switch self{
        case .Monster:
            try container.encode(0, forKey:.rawValue)
        case .Magic:
            try container.encode(1, forKey:.rawValue)
        case .Source:
            try container.encode(2, forKey:.rawValue)
        }
    }
}

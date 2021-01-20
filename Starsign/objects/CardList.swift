//
//  CardList.swift
//  Starsign
//
//  Created by Guylian Bollon on 31/10/2020.
//

import Foundation

struct CardList:Codable{
    var cards=[Card]()
    init(cards:[Card]=[]){
        self.cards=cards
    }
}

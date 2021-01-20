//
//  CardController.swift
//  Starsign
//
//  Created by Guylian Bollon on 28/10/2020.
//

import Foundation

class CardController{
    
    static let shared = CardController()
    
    static let cardUpdatedNotification = Notification.Name("CardController.MenuUpdated")
    let baseURL = URL(string: "http://localhost:8080/card")!
    var cards = [Card](){
        didSet {
            NotificationCenter.default.post(name:CardController.cardUpdatedNotification, object: nil)
        }
    }
    func submitCard(card: Recard, completion: @escaping(Recard?) -> Void){
        var request = URLRequest(url:baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(card)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request){
            (data,response,error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let card = try? jsonDecoder.decode(Recard.self, from:data){
                completion(card)
            }
            else{
                completion(nil)
            }
        }
        task.resume()
    }
    
    func getCards(completion:@escaping([Card]?) -> Void){
        var request = URLRequest(url:baseURL)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with:request){
            (data,response,error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let recards = try? jsonDecoder.decode([Recard].self, from:data){
                var cards = [Card]()
                recards.forEach{
                    recard in
                    if(recard.type == Type.Monster){
                        cards.append(Monster(card:recard))
                    }
                    if(recard.type == Type.Magic){
                        cards.append(Magic(card:recard))
                    }
                    if(recard.type == Type.Source){
                        cards.append(Source(card:recard))
                    }
                }
                completion(cards)
            }
            else{
                completion(nil)
            }
        }
        task.resume()
    }
    
    func removeCard(card:Recard, completion:@escaping(Recard?) -> Void){
        var request = URLRequest(url:baseURL)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(card)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with:request){
            (data,response,error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let card = try? jsonDecoder.decode(Recard.self, from:data){
                completion(card)
            }
            else{
                completion(nil)
            }
        }
        task.resume()
    }
    
}

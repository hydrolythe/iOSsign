//
//  CardTableViewController.swift
//  Starsign
//
//  Created by Guylian Bollon on 31/10/2020.
//

import UIKit

class CardTableViewController: UITableViewController {
    var card: Card?
    override func viewDidLoad() {
        super.viewDidLoad()
        CardController.shared.getCards{ (cards) in
            if let cards = cards{
                CardController.shared.cards = cards
            }
        }
        NotificationCenter.default.addObserver(tableView, selector: #selector(UITableView.reloadData), name:CardController.cardUpdatedNotification,object:nil)
         // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardController.shared.cards.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cardcell", for: indexPath) as! CardTableViewCell
        let card = CardController.shared.cards[indexPath.row]
        cell.update(with:card)
        cell.showsReorderControl = true
        // Configure the cell...
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let card:Card = CardController.shared.cards.remove(at:indexPath.row)
            var recard:Recard
            if(card is Monster){
                let monsterCard = card as! Monster
                recard = Recard(monster:monsterCard)
            }
            else if(card is Magic){
                let magicCard = card as! Magic
                recard = Recard(magic:magicCard)
            }
            else{
                let sourceCard = card as! Source
                recard = Recard(source:sourceCard)
            }
            CardController.shared.removeCard(card: recard){ (card) in
                
            }
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "monstersegue"){
            let viewController = segue.destination as! MonsterSelectionViewController
            viewController.monster = card as? Monster
        }
        if(segue.identifier == "magicsegue"){
            let viewController = segue.destination as! MagicSelectionViewController
            viewController.magic = card as? Magic
        }
        if(segue.identifier == "sourcesegue"){
            let viewController = segue.destination as! SourceSelectionViewController
            viewController.source = card as? Source
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.cellForRow(at: indexPath) != nil else { return }
        card = CardController.shared.cards[indexPath.row]
        if(card is Monster){
            performSegue(withIdentifier: "monstersegue", sender: self)
        }
        if(card is Magic){
            performSegue(withIdentifier: "magicsegue", sender: self)
        }
        if(card is Source){
            performSegue(withIdentifier: "sourcesegue", sender: self)
        }
    }
}

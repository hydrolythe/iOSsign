//
//  MagicSelectionViewController.swift
//  Starsign
//
//  Created by Guylian Bollon on 18/11/2020.
//

import UIKit

class MagicSelectionViewController: UITableViewController {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var manaapeironlabel: UILabel!
    @IBOutlet weak var manaatomlabel: UILabel!
    @IBOutlet weak var manaformlabel: UILabel!
    @IBOutlet weak var manasoullabel: UILabel!
    @IBOutlet weak var manatimelabel: UILabel!
    @IBOutlet weak var manavoidlabel: UILabel!
    @IBOutlet weak var healplayerlabel: UILabel!
    @IBOutlet weak var healmonsterlabel: UILabel!
    @IBOutlet weak var boostattacklabel: UILabel!
    @IBOutlet weak var boostdefenselabel: UILabel!
    @IBOutlet weak var boostmagicattacklabel: UILabel!
    @IBOutlet weak var boostmagicdefenselabel: UILabel!
    @IBOutlet weak var healmplabel: UILabel!
    @IBOutlet weak var spellspecieslabel: UILabel!
    var magic: Magic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlelabel.text = magic.title
        manaapeironlabel.text = magic.cost.keys.contains(Mana.APEIRON) ? String(magic.cost[Mana.APEIRON]!) : "0"
        manaatomlabel.text = magic.cost.keys.contains(Mana.ATOM) ? String(magic.cost[Mana.ATOM]!) : "0"
        manaformlabel.text = magic.cost.keys.contains(Mana.FORM) ? String(magic.cost[Mana.FORM]!) : "0"
        manasoullabel.text = magic.cost.keys.contains(Mana.SOUL) ? String(magic.cost[Mana.SOUL]!) : "0"
        manatimelabel.text = magic.cost.keys.contains(Mana.TIME) ? String(magic.cost[Mana.TIME]!) : "0"
        manavoidlabel.text = magic.cost.keys.contains(Mana.VOID) ? String(magic.cost[Mana.VOID]!) : "0"
        healplayerlabel.text = magic.magic.keys.contains(Spell.HEALPLAYER) ? String(magic.magic[Spell.HEALPLAYER]!) : "0"
        healmonsterlabel.text = magic.magic.keys.contains(Spell.HEALMONSTER) ? String(magic.magic[Spell.HEALMONSTER]!) : "0"
        boostattacklabel.text = magic.magic.keys.contains(Spell.BOOSTATTACK) ? String(magic.magic[Spell.BOOSTATTACK]!) : "0"
        boostdefenselabel.text = magic.magic.keys.contains(Spell.BOOSTDEFENSE) ? String(magic.magic[Spell.BOOSTDEFENSE]!) : "0"
        boostmagicattacklabel.text = magic.magic.keys.contains(Spell.BOOSTMAGICATTACK) ? String(magic.magic[Spell.BOOSTMAGICATTACK]!) : "0"
        boostmagicdefenselabel.text = magic.magic.keys.contains(Spell.BOOSTMAGICDEFENSE) ? String(magic.magic[Spell.BOOSTMAGICDEFENSE]!) : "0"
        healmplabel.text = magic.magic.keys.contains(Spell.HEALMP) ? String(magic.magic[Spell.HEALMP]!) : "0"
        spellspecieslabel.text = magic.specie.toString()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

/*    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
/*    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

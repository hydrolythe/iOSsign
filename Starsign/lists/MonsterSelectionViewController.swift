//
//  MonsterSelectionViewController.swift
//  Starsign
//
//  Created by Guylian Bollon on 18/11/2020.
//

import UIKit

class MonsterSelectionViewController: UITableViewController {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var manaapeironlabel: UILabel!
    @IBOutlet weak var manaatomlabel: UILabel!
    @IBOutlet weak var manaformlabel: UILabel!
    @IBOutlet weak var manasoullabel: UILabel!
    @IBOutlet weak var manatimelabel: UILabel!
    @IBOutlet weak var manavoidlabel: UILabel!
    @IBOutlet weak var lifelabel: UILabel!
    @IBOutlet weak var attacklabel: UILabel!
    @IBOutlet weak var defenselabel: UILabel!
    @IBOutlet weak var magicattacklabel: UILabel!
    @IBOutlet weak var magicdefenselabel: UILabel!
    @IBOutlet weak var mplabel: UILabel!
    @IBOutlet weak var healplayerlabel: UILabel!
    @IBOutlet weak var healmonsterlabel: UILabel!
    @IBOutlet weak var boostattacklabel: UILabel!
    @IBOutlet weak var boostdefenselabel: UILabel!
    @IBOutlet weak var boostmagicattacklabel: UILabel!
    @IBOutlet weak var boostmagicdefenselabel: UILabel!
    @IBOutlet weak var healmplabel: UILabel!
    var monster: Monster!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlelabel.text = monster?.title
        manaapeironlabel.text = monster.manarequirements.keys.contains(Mana.APEIRON) ? String(monster.manarequirements[Mana.APEIRON]!) : "0"
        manaatomlabel.text = monster.manarequirements.keys.contains(Mana.ATOM) ? String(monster.manarequirements[Mana.ATOM]!) : "0"
        manaformlabel.text = monster.manarequirements.keys.contains(Mana.FORM) ? String(monster.manarequirements[Mana.FORM]!) : "0"
        manasoullabel.text = monster.manarequirements.keys.contains(Mana.SOUL) ? String(monster.manarequirements[Mana.SOUL]!) : "0"
        manatimelabel.text = monster.manarequirements.keys.contains(Mana.TIME) ? String(monster.manarequirements[Mana.TIME]!) : "0"
        manavoidlabel.text = monster.manarequirements.keys.contains(Mana.VOID) ? String(monster.manarequirements[Mana.VOID]!) : "0"
        lifelabel.text = String(monster.life)
        attacklabel.text = String(monster.attack)
        defenselabel.text = String(monster.defense)
        magicattacklabel.text = String(monster.magicattack)
        magicdefenselabel.text = String(monster.magicdefense)
        mplabel.text = String(monster.mp)
        healplayerlabel.text = monster.magic.keys.contains(Spell.HEALPLAYER) ? String(monster.magic[Spell.HEALPLAYER]!) : "0"
        healmonsterlabel.text = monster.magic.keys.contains(Spell.HEALMONSTER) ? String(monster.magic[Spell.HEALMONSTER]!) : "0"
        boostattacklabel.text = monster.magic.keys.contains(Spell.BOOSTATTACK) ? String(monster.magic[Spell.BOOSTATTACK]!) : "0"
        boostdefenselabel.text = monster.magic.keys.contains(Spell.BOOSTDEFENSE) ? String(monster.magic[Spell.BOOSTDEFENSE]!) : "0"
        boostmagicattacklabel.text = monster.magic.keys.contains(Spell.BOOSTMAGICATTACK) ? String(monster.magic[Spell.BOOSTMAGICATTACK]!) : "0"
        boostmagicdefenselabel.text = monster.magic.keys.contains(Spell.BOOSTMAGICDEFENSE) ? String(monster.magic[Spell.BOOSTMAGICDEFENSE]!) : "0"
        healmplabel.text = monster.magic.keys.contains(Spell.HEALMP) ? String(monster.magic[Spell.HEALMP]!) : "0"
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

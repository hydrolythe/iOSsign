//
//  MonsterCreatorViewController.swift
//  Starsign
//
//  Created by Guylian Bollon on 17/10/2020.
//

import UIKit

class MonsterCreatorViewController: UITableViewController {

    @IBOutlet weak var savebutton: UIBarButtonItem!
    @IBOutlet weak var titletextfield: UITextField!
    @IBOutlet weak var manaapeironlabel: UILabel!
    @IBOutlet weak var manaatomlabel: UILabel!
    @IBOutlet weak var manaformlabel: UILabel!
    @IBOutlet weak var manatimelabel: UILabel!
    @IBOutlet weak var manasoullabel: UILabel!
    @IBOutlet weak var manavoidlabel: UILabel!
    @IBOutlet weak var manaapeironswitch: UIStepper!
    @IBOutlet weak var manaatomswitch: UIStepper!
    @IBOutlet weak var manaformswitch: UIStepper!
    @IBOutlet weak var manatimeswitch: UIStepper!
    @IBOutlet weak var manasoulswitch: UIStepper!
    @IBOutlet weak var manavoidswitch: UIStepper!
    @IBOutlet weak var attacklabel: UILabel!
    @IBOutlet weak var attackswitch: UIStepper!
    @IBOutlet weak var defenselabel: UILabel!
    @IBOutlet weak var defenseswitch: UIStepper!
    @IBOutlet weak var lifelabel: UILabel!
    @IBOutlet weak var lifeswitch: UIStepper!
    @IBOutlet weak var magicattacklabel: UILabel!
    @IBOutlet weak var magicattackswitch: UIStepper!
    @IBOutlet weak var magicdefenselabel: UILabel!
    @IBOutlet weak var magicdefenseswitch: UIStepper!
    @IBOutlet weak var mplabel: UILabel!
    @IBOutlet weak var mpswitch: UIStepper!
    @IBOutlet weak var healplayerlabel: UILabel!
    @IBOutlet weak var healplayerswitch: UIStepper!
    @IBOutlet weak var healmonsterlabel: UILabel!
    @IBOutlet weak var healmonsterswitch: UIStepper!
    @IBOutlet weak var boostattacklabel: UILabel!
    @IBOutlet weak var boostattackswitch: UIStepper!
    @IBOutlet weak var boostdefenselabel: UILabel!
    @IBOutlet weak var boostdefenseswitch: UIStepper!
    @IBOutlet weak var boostmagicattacklabel: UILabel!
    @IBOutlet weak var boostmagicattackswitch: UIStepper!
    @IBOutlet weak var boostmagicdefenselabel: UILabel!
    @IBOutlet weak var boostmagicdefenseswitch: UIStepper!
    @IBOutlet weak var healmplabel: UILabel!
    @IBOutlet weak var healmpswitch: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        alternatemanaapeiron()
        alternatemanaatom()
        alternatemanaform()
        alternatemanatime()
        alternatemanasoul()
        alternatemanavoid()
        alternatelife()
        alternateattack()
        alternatedefense()
        alternatemagicattack()
        alternatemagicdefense()
        alternatemp()
        alternatehealplayer()
        alternatehealmonster()
        alternateboostattack()
        alternateboostdefense()
        alternateboostmagicattack()
        alternateboostmagicdefense()
        alternatehealmp()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func onSave(_ sender: Any) {
        guard(titletextfield.hasText) else{
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 200, height: 35))
            toastLabel.backgroundColor = UIColor.red
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center;
            toastLabel.text = "The title wasn't filled in"
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
            return
        }
        var manas = [Mana:Int]()
        if(Int(manaapeironswitch.value) != 0){
            manas[Mana.APEIRON]=Int(manaapeironswitch.value)
        }
        if(Int(manaatomswitch.value) != 0){
            manas[Mana.ATOM]=Int(manaatomswitch.value)
        }
        if(Int(manaformswitch.value) != 0){
            manas[Mana.FORM]=Int(manaformswitch.value)
        }
        if(Int(manatimeswitch.value) != 0){
            manas[Mana.TIME]=Int(manatimeswitch.value)
        }
        if(Int(manasoulswitch.value) != 0){
            manas[Mana.SOUL]=Int(manasoulswitch.value)
        }
        if(Int(manavoidswitch.value) != 0){
            manas[Mana.VOID]=Int(manavoidswitch.value)
        }
        var spells = [Spell:Int]()
        if(Int(healplayerswitch.value) != 0){
            spells[Spell.HEALPLAYER]=Int(healplayerswitch.value)
        }
        if(Int(healmonsterswitch.value) != 0){
            spells[Spell.HEALMONSTER]=Int(healmonsterswitch.value)
        }
        if(Int(boostattackswitch.value) != 0){
            spells[Spell.BOOSTATTACK]=Int(boostattackswitch.value)
        }
        if(Int(boostdefenseswitch.value) != 0){
            spells[Spell.BOOSTDEFENSE]=Int(boostdefenseswitch.value)
        }
        if(Int(boostmagicattackswitch.value) != 0){
            spells[Spell.BOOSTMAGICATTACK]=Int(boostmagicattackswitch.value)
        }
        if(Int(boostmagicdefenseswitch.value) != 0){
            spells[Spell.BOOSTMAGICDEFENSE]=Int(boostmagicdefenseswitch.value)
        }
        if(Int(healmpswitch.value) != 0){
            spells[Spell.HEALMP]=Int(healmpswitch.value)
        }
        let monster = Monster(title:titletextfield.text!,manarequirements: manas,life:Int(lifeswitch.value),attack:Int(attackswitch.value),defense:Int(defenseswitch.value),magicattack: Int(magicattackswitch.value),magicdefense: Int(magicdefenseswitch.value),mp:Int(mpswitch.value),magic:spells)
        CardController.shared.cards.append(monster)
        let recard = Recard(monster:monster)
        CardController.shared.submitCard(card:recard) { (card) in
            
        }
        self.titletextfield.text?.removeAll()
        self.manaapeironswitch.value = 0
        self.alternatemanaapeiron()
        self.manaatomswitch.value = 0
        self.alternatemanaatom()
        self.manaformswitch.value = 0
        self.alternatemanaform()
        self.manatimeswitch.value = 0
        self.alternatemanatime()
        self.manasoulswitch.value = 0
        self.alternatemanasoul()
        self.manavoidswitch.value = 0
        self.alternatemanavoid()
        self.lifeswitch.value = 0
        self.alternatelife()
        self.attackswitch.value = 0
        self.alternateattack()
        self.defenseswitch.value = 0
        self.alternatedefense()
        self.magicattackswitch.value = 0
        self.alternatemagicattack()
        self.magicdefenseswitch.value = 0
        self.alternatemagicdefense()
        self.mpswitch.value = 0
        self.alternatemp()
        self.healplayerswitch.value = 0
        self.alternatehealplayer()
        self.healmonsterswitch.value = 0
        self.alternatehealmonster()
        self.boostattackswitch.value = 0
        self.alternateboostattack()
        self.boostdefenseswitch.value = 0
        self.alternateboostdefense()
        self.boostmagicattackswitch.value = 0
        self.alternateboostmagicattack()
        self.boostmagicdefenseswitch.value = 0
        self.alternateboostmagicdefense()
        self.healmpswitch.value = 0
        self.alternatehealmp()
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 250, height: 35))
        toastLabel.backgroundColor = UIColor.blue
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = "Card was successfully added."
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    // MARK: - Table view data source

/*    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    @IBAction func manaapeironchanged(_ sender: Any) {
        alternatemanaapeiron()
    }
    func alternatemanaapeiron(){
        manaapeironlabel.text="\(Int(manaapeironswitch.value))"
    }
    @IBAction func manaatomchanged(_ sender: Any) {
        alternatemanaatom()
    }
    func alternatemanaatom(){
        manaatomlabel.text="\(Int(manaatomswitch.value))"
    }
    @IBAction func manaformchanged(_ sender: Any) {
        alternatemanaform()
    }
    func alternatemanaform(){
        manaformlabel.text="\(Int(manaformswitch.value))"
    }
    @IBAction func manatimechanged(_ sender: Any) {
        alternatemanatime()
    }
    func alternatemanatime(){
        manatimelabel.text="\(Int(manatimeswitch.value))"
    }
    @IBAction func manasoulchanged(_ sender: Any) {
        alternatemanasoul()
    }
    func alternatemanasoul(){
        manasoullabel.text="\(Int(manasoulswitch.value))"
    }
    @IBAction func manavoidchanged(_ sender: Any) {
        alternatemanavoid()
    }
    func alternatemanavoid(){
        manavoidlabel.text="\(Int(manavoidswitch.value))"
    }
    @IBAction func lifechanged(_ sender: Any) {
        alternatelife()
    }
    func alternatelife(){
        lifelabel.text="\(Int(lifeswitch.value))"
    }
    @IBAction func attackchanged(_ sender: Any) {
        alternateattack()
    }
    func alternateattack(){
        attacklabel.text="\(Int(attackswitch.value))"
    }
    @IBAction func defensechanged(_ sender: Any) {
        alternatedefense()
    }
    func alternatedefense(){
        defenselabel.text="\(Int(defenseswitch.value))"
    }
    @IBAction func magicattackchanged(_ sender: Any) {
        alternatemagicattack()
    }
    func alternatemagicattack(){
        magicattacklabel.text="\(Int(magicattackswitch.value))"
    }
    @IBAction func magicdefensechanged(_ sender: Any) {
        alternatemagicdefense()
    }
    func alternatemagicdefense(){
        magicdefenselabel.text="\(Int(magicdefenseswitch.value))"
    }
    @IBAction func mpchanged(_ sender: Any) {
        alternatemp()
    }
    func alternatemp(){
        mplabel.text="\(Int(mpswitch.value))"
    }
    @IBAction func mpamounthealplayerchanged(_ sender: Any) {
        alternatehealplayer()
    }
    func alternatehealplayer(){
        healplayerlabel.text="\(Int(healplayerswitch.value))"
    }
    @IBAction func mpamounthealmonsterchanged(_ sender: Any) {
        alternatehealmonster()
    }
    func alternatehealmonster(){
        healmonsterlabel.text="\(Int(healmonsterswitch.value))"
    }
    @IBAction func mpamountboostattackchanged(_ sender: Any) {
        alternateboostattack()
    }
    func alternateboostattack(){
        boostattacklabel.text="\(Int(boostattackswitch.value))"
    }
    @IBAction func mpamountboostdefensechanged(_ sender: Any) {
        alternateboostdefense()
    }
    func alternateboostdefense(){
        boostdefenselabel.text="\(Int(boostdefenseswitch.value))"
    }
    @IBAction func mpamountboostmagicattackchanged(_ sender: Any) {
        alternateboostmagicattack()
    }
    func alternateboostmagicattack(){
        boostmagicattacklabel.text="\(Int(magicattackswitch.value))"
    }
    @IBAction func mpamountboostmagicdefensechanged(_ sender: Any) {
        alternateboostmagicdefense()
    }
    func alternateboostmagicdefense(){
        boostmagicdefenselabel.text="\(Int(boostmagicdefenseswitch.value))"
    }
    @IBAction func mpamounthealmpchanged(_ sender: Any) {
        alternatehealmp()
    }
    func alternatehealmp(){
        healmplabel.text="\(Int(healmpswitch.value))"
    }
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

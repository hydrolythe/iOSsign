//
//  SourceCreatorViewController.swift
//  Starsign
//
//  Created by Guylian Bollon on 17/10/2020.
//

import UIKit

class SourceCreatorViewController: UITableViewController {
    @IBOutlet weak var Savebutton: UIBarButtonItem!
    @IBOutlet weak var titletextfield: UITextField!
    @IBOutlet weak var manaapeironlabel: UILabel!
    @IBOutlet weak var manaapeironswitch: UIStepper!
    @IBOutlet weak var manaatomlabel: UILabel!
    @IBOutlet weak var manaatomswitch: UIStepper!
    @IBOutlet weak var manaformlabel: UILabel!
    @IBOutlet weak var manaformswitch: UIStepper!
    @IBOutlet weak var manatimelabel: UILabel!
    @IBOutlet weak var manatimeswitch: UIStepper!
    @IBOutlet weak var manasoullabel: UILabel!
    @IBOutlet weak var manasoulswitch: UIStepper!
    @IBOutlet weak var manavoidlabel: UILabel!
    @IBOutlet weak var manavoidswitch: UIStepper!    
    override func viewDidLoad() {
        super.viewDidLoad()
        alternatemanaapeiron()
        alternatemanaatom()
        alternatemanaform()
        alternatemanatime()
        alternatemanasoul()
        alternatemanavoid()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

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
        let source = Source(title:titletextfield.text!,generatedmana:manas)
        let recard = Recard(source:source)
        CardController.shared.cards.append(source)
        CardController.shared.submitCard(card: recard){ (card) in
            
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
    
        
    /*    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    @IBAction func manaapeironswitchgenerated(_ sender: Any) {
        alternatemanaapeiron()
    }
    func alternatemanaapeiron(){
        manaapeironlabel.text="\(Int(manaapeironswitch.value))"
    }
    @IBAction func manaatomswitchgenerated(_ sender: Any) {
        alternatemanaatom()
    }
    func alternatemanaatom(){
        manaatomlabel.text="\(Int(manaatomswitch.value))"
    }
    @IBAction func manaformswitchgenerated(_ sender: Any) {
        alternatemanaform()
    }
    func alternatemanaform(){
        manaformlabel.text="\(Int(manaformswitch.value))"
    }
    @IBAction func manatimeswitchgenerated(_ sender: Any) {
        alternatemanatime()
    }
    func alternatemanatime(){
        manatimelabel.text="\(Int(manatimeswitch.value))"
    }
    @IBAction func manasoulswitchgenerated(_ sender: Any) {
        alternatemanasoul()
    }
    func alternatemanasoul(){
        manasoullabel.text="\(Int(manasoulswitch.value))"
    }
    @IBAction func manavoidswitchgenerated(_ sender: Any) {
        alternatemanavoid()
    }
    func alternatemanavoid(){
        manavoidlabel.text="\(Int(manavoidswitch.value))"
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

//
//  UpdateviewViewController.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import UIKit

@available(iOS 13.0, *)
class UpdateviewViewController: UIViewController {

    @IBOutlet weak var latefinetextfeild: UITextField!
    @IBOutlet weak var idtextfeild: UITextField!
    @IBOutlet weak var nametextfeild: UITextField!
    @IBOutlet weak var authortextfeild: UITextField!
    @IBOutlet weak var shadowviewone: UIView!
    @IBOutlet weak var finedetailtextfeild: UITextField!
    @IBOutlet weak var returnontextfeild: UITextField!
    @IBOutlet weak var issontextfeild: UITextField!
    @IBOutlet weak var isstotextfeild: UITextField!
    @IBOutlet weak var shadoviewtwo: UIView!
    
    var currentBookSelection = Books()
    var yourBooks = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTheDetails()
        
        self.shadoviewtwo.layer.cornerRadius = 10
       // self.bgview.layer.borderColor = Colors.colorClear.cgColor
        self.shadoviewtwo.layer.masksToBounds = true
        
        self.shadoviewtwo.layer.shadowOpacity = 2//0.18
        self.shadoviewtwo.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.shadoviewtwo.layer.shadowRadius = 2
        self.shadoviewtwo.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadoviewtwo.layer.masksToBounds = false
        
        
        self.shadowviewone.layer.cornerRadius = 10
       // self.bgview.layer.borderColor = Colors.colorClear.cgColor
        self.shadowviewone.layer.masksToBounds = true
        
        self.shadowviewone.layer.shadowOpacity = 2//0.18
        self.shadowviewone.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.shadowviewone.layer.shadowRadius = 2
        self.shadowviewone.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowviewone.layer.masksToBounds = false
        // Do any additional setup after loading the view.
    }
    
    func fillTheDetails(){
        nametextfeild.text = currentBookSelection.name
        authortextfeild.text = currentBookSelection.author
        idtextfeild.text = currentBookSelection.id
        latefinetextfeild.text = currentBookSelection.lfine
        isstotextfeild.text = currentBookSelection.to
        issontextfeild.text = currentBookSelection.on
        returnontextfeild.text = currentBookSelection.returns
        finedetailtextfeild.text = currentBookSelection.dfine
        yourBooks = currentBookSelection.maincategory!
    }
    @IBAction func updatebtn(_ sender: Any) {
        let data_Dict = ["name":nametextfeild.text!,"author":authortextfeild.text!,"id":idtextfeild.text!,"lfine":latefinetextfeild.text!,"to":isstotextfeild.text!,"on":issontextfeild.text!,"returns":returnontextfeild.text!,"dfine":finedetailtextfeild.text!,"maincategory":yourBooks]  as [String : Any]
        let updatedValue =  SaveCoreData.share_instance.updateTheBookValues(object: data_Dict as [String : AnyObject], predicate:yourBooks, subpredicate: currentBookSelection.name!)
        if updatedValue{
            self.navigationController?.popViewController(animated: true)
        }else{
            SaveCoreData.share_instance.toastMessage("Can't update,something went wrong")
        }
    }
    @IBAction func homebtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

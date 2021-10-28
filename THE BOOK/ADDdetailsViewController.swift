//
//  ADDdetailsViewController.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import UIKit

@available(iOS 13.0, *)
class ADDdetailsViewController: UIViewController {

    @IBOutlet weak var finetextfeild: UITextField!
    @IBOutlet weak var finedetailstextfeild: UITextField!
    @IBOutlet weak var returnontextfeild: UITextField!
    @IBOutlet weak var issontextfeild: UITextField!
    @IBOutlet weak var isstextfeild: UITextField!
    @IBOutlet weak var idtextfeild: UITextField!
    @IBOutlet weak var authortextfeild: UITextField!
    @IBOutlet weak var nametextfeild: UITextField!
    @IBOutlet weak var shadowviewtwo: UIView!
    @IBOutlet weak var shadowviwone: UIView!
    var selectedBook = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.shadowviwone.layer.cornerRadius = 10
       // self.bgview.layer.borderColor = Colors.colorClear.cgColor
        self.shadowviwone.layer.masksToBounds = true
        
        self.shadowviwone.layer.shadowOpacity = 2//0.18
        self.shadowviwone.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.shadowviwone.layer.shadowRadius = 2
        self.shadowviwone.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowviwone.layer.masksToBounds = false
        
        
        self.shadowviewtwo.layer.cornerRadius = 10
       // self.bgview.layer.borderColor = Colors.colorClear.cgColor
        self.shadowviewtwo.layer.masksToBounds = true
        
        self.shadowviewtwo.layer.shadowOpacity = 2//0.18
        self.shadowviewtwo.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.shadowviewtwo.layer.shadowRadius = 2
        self.shadowviewtwo.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowviewtwo.layer.masksToBounds = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savebtn(_ sender: Any) {
        let data_Dict = ["name":nametextfeild.text!,"author":authortextfeild.text!,"id":idtextfeild.text!,"lfine":finetextfeild.text!,"to":isstextfeild.text!,"on":issontextfeild.text!,"return":returnontextfeild.text!,"dfine":finedetailstextfeild.text!,"maincategory":selectedBook]  as [String : Any]
        let resultValue = SaveCoreData.share_instance.saveDataInCoreData(object:data_Dict as [String : AnyObject])
        if resultValue{
            self.navigationController?.popViewController(animated: true)
        }else{
            SaveCoreData.share_instance.toastMessage("Can't update,something went wrong")
        }
        print("the values saved are",data_Dict)
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
